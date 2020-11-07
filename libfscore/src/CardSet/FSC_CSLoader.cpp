/**
 *  FSC_CSLoader.cpp
 *
 *  This file is part of the featherStack app project.
 *  See the AUTHORS file for Copyright information.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

// C++ / C
#include <cstdlib>

// External

// Project
#include "./FSC_CSLoader.h"
#include "../File/FSC_ValueFile.h"
#include "../Error/FSC_ErrorInternal.h"

// Pre-defined
#ifndef FSC_CL_THREAD_COUNT
    #define FSC_CL_THREAD_COUNT                      1
#elif FSC_CL_THREAD_COUNT < 0
    #define FSC_CL_THREAD_COUNT                      1
#elif FSC_CL_THREAD_COUNT > 2
    #define FSC_CL_THREAD_COUNT                      2
#endif

namespace
{
    // Card value identifiers, data load
    enum Identifier
    {
        TYPE = 0,
        DATA = 1,
        QUESTION = 2,
        ANSWER = 3,
        
        IDENTIFIER_MAX = ANSWER,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1
    };
    
    const char* p_Identifier[IDENTIFIER_COUNT] =
    {
        "Type",
        "Data",
        "Question",
        "Answer"
    };
    
    const char* p_MainBlock = "Card";
}


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_CSLoader::FSC_CSLoader(size_t us_CacheLimit) : c_Cache(us_CacheLimit),
                                                   b_Stop(false)
{
    // Create initial empty cards to load into
    // NOTE: This is needed, otherwise the first thread adds to cache
    //       which causes the next load to overwrite the first load
    FSC_Card* p_Card;
    
    for (; us_CacheLimit > 0; --us_CacheLimit) // Always dec even on card fail, add again later
    {
        // NOTE: We add pointers so that outsiders can't really mess with an internal class
        //       in case we would add it differently
        try
        {
            c_Cache.Add((p_Card = new FSC_Card()));
        }
        catch (std::bad_alloc& e)
        {
            printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        }
        catch (std::exception& e)
        {
            printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        }
    }
    
    // Populate thread list
    // NOTE: us_CacheLimit is zero here
    for (; us_CacheLimit < FSC_CL_THREAD_COUNT; ++us_CacheLimit)
    {
        v_Thread.emplace_back(ThreadLoad, this);
    }
}
                             
FSC_CSLoader::~FSC_CSLoader() noexcept
{
    b_Stop = true;
    c_Condition.notify_all();
    
    for (auto& Thread : v_Thread)
    {
        Thread.join();
    }
}

FSC_CSLoader::JobList::JobList() noexcept
{}

FSC_CSLoader::JobList::~JobList() noexcept
{}

//*************************************************************************************
// Thread
//*************************************************************************************

void FSC_CSLoader::ThreadCardSetup(FSC_Card* p_Card, std::string const& s_FilePath)
{
    try
    {
        // Update card file info
        FSC_ValueFile c_File(s_FilePath);
        
        p_Card->s_FilePath = s_FilePath;
        p_Card->i_CardType = static_cast<int>(std::stoi(c_File.GetValue(p_MainBlock,
                                                                        p_Identifier[TYPE])));
        p_Card->s_Data = c_File.GetValue(p_MainBlock, p_Identifier[DATA]);
        p_Card->s_Question = c_File.GetValue(p_MainBlock, p_Identifier[QUESTION]);
        p_Card->s_Answer = c_File.GetValue(p_MainBlock, p_Identifier[ANSWER]);
    }
    catch (FSC_Exception& e)
    {
        // Reset card path, we don't want this to be recievable
        p_Card->s_FilePath = "";
        throw;
    }
}

void FSC_CSLoader::ThreadLoad(FSC_CSLoader* p_Instance) noexcept
{
    FSC_Card* p_Card;
    
    FSC_Callback p_Callback;
    FSC_Destination p_Destination;
    std::string s_FilePath;
    
    while (!(p_Instance->b_Stop))
    {
        // Do we have a job to do?
        if (!(p_Instance->c_JobList.Claim(p_Callback, p_Destination, s_FilePath)))
        {
            std::unique_lock<std::mutex> c_UniqueLock(p_Instance->c_ConditionMutex);
            p_Instance->c_Condition.wait(c_UniqueLock);
            
            // We need this continue, re-enter loop at top and either quit if requested
            // or grab a job
            continue;
        }
        
        // Can we reuse a card, or do we have to allocate?
        // NOTE: Don't forget to return jobs taken here on failures!
        //       Also, check for empty cache not full! Otherwise each
        //       card given out but not returned causes a new allocation!
        //
        //       Also, don't reuse the pointer currently stored.
        try
        {
            if (p_Instance->c_Cache.GetCount() == 0)
            {
                p_Card = new FSC_Card();
            }
            else
            {
                // Grab oldest (0)
                // @TODO: Grab by path if existing - Save reload time
                p_Card = p_Instance->c_Cache.GetNext();
            }
        }
        catch (std::bad_alloc& e)
        {
            printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
            FSC_ESetError(FSC_ERROR_GENERAL_MALLOC);
            
            p_Instance->c_JobList.Add(p_Callback, p_Destination, s_FilePath, true);
            continue;
        }
        catch (std::exception& e)
        {
            printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
            FSC_ESetError(FSC_ERROR_UNK);
            
            p_Instance->c_JobList.Add(p_Callback, p_Destination, s_FilePath, true);
            continue;
        }
        
        // Try card setup and send to required spot
        try
        {
            // NOTE: There might be cases where
            //       1. A Cache miss causes a load
            //       2. The card is returned after the card was given
            //       3. The card to overwrite is the requested one
            //       -> Do not overwrite, already loaded!
            if (p_Card->s_FilePath.compare(s_FilePath) != 0)
            {
                ThreadCardSetup(p_Card, s_FilePath);
            }
            
            // All done, either assign to destination or add to available
            // NOTE: Space is available and card valid, no throw here
            if (p_Callback != NULL)
            {
                p_Callback(p_Card, p_Destination);
            }
            else
            {
                // Add to top (behind last)
                p_Instance->c_Cache.Add(p_Card);
            }
        }
        catch (FSC_Exception& e)
        {
            printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
            
            // Are we supposed to assign to destination? Use NULL if so, we failed
            if (p_Callback != NULL)
            {
                p_Callback(p_Card, NULL);
            }
            
            // Add failed to cache, reuse
            p_Instance->c_Cache.Add(p_Card);
        }
    }
}

//*************************************************************************************
// Job
//*************************************************************************************

void FSC_CSLoader::JobList::Add(FSC_Callback const& p_Callback, FSC_Destination& p_Destination, std::string const& s_FilePath, bool b_Front) noexcept
{
    std::lock_guard<std::mutex> c_Guard(c_Mutex);
    
    if (b_Front)
    {
        l_Job.emplace_front(std::make_pair(std::make_pair(p_Callback, p_Destination), s_FilePath));
    }
    else
    {
        l_Job.emplace_back(std::make_pair(std::make_pair(p_Callback, p_Destination), s_FilePath));
    }
}

bool FSC_CSLoader::JobList::Claim(FSC_Callback& p_Callback, FSC_Destination& p_Destination, std::string& s_FilePath) noexcept
{
    std::lock_guard<std::mutex> c_Guard(c_Mutex);
    
    // No job?
    if (l_Job.size() == 0)
    {
        return false;
    }
    
    p_Callback = l_Job.begin()->first.first;
    p_Destination = l_Job.begin()->first.second;
    s_FilePath = l_Job.begin()->second;
    
    l_Job.pop_front();
    return true;
}

//*************************************************************************************
// Add Card
//*************************************************************************************

void FSC_CSLoader::AddToCache(FSC_Card*& p_Card) noexcept
{
    // Adding an available card moves it to the cache, replacing
    // an older one if needed since we most likely reuse it. Old
    // cards can also be used to save a malloc() call
    try
    {
        c_Cache.Add(p_Card);
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        return;
    }
}

//*************************************************************************************
// Load Card
//*************************************************************************************

void FSC_CSLoader::LoadCard(std::string const& s_FilePath, FSC_Callback p_Callback, FSC_Destination p_Destination) noexcept
{
    // Valid file path?
    if (s_FilePath.length() == 0 || s_FilePath.length() > FSC_CD_STR_MAX_LENGTH)
    {
        // Set before possible callback, so it can react to the error
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        
        // Assignment required? Set NULL to indicate failure.
        if (p_Callback != NULL && p_Destination != NULL)
        {
            p_Callback(NULL, p_Destination);
        }
        
        return;
    }
    
    // Already available? Assign instantly, no need to wait
    if (c_Cache.GetCount() > 0)
    {
        try
        {
            FSC_Card* p_Card = c_Cache.GetPath(s_FilePath);
            
            if (p_Callback != NULL && p_Destination != NULL)
            {
                p_Callback(p_Card, p_Destination);
            }
            else
            {
                c_Cache.Add(p_Card); // Return to cache
            }
            
            return;
        }
        catch (...)
        {}
    }
    
    // Nothing in cache, load new
    c_JobList.Add(p_Callback, p_Destination, s_FilePath);
    c_Condition.notify_one();
}

//*************************************************************************************
// Getters
//*************************************************************************************

size_t FSC_CSLoader::GetCacheSize() noexcept
{
    return c_Cache.GetStorageLimit();
}
