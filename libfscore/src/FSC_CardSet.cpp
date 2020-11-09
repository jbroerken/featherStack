/**
 *  FSC_CardSet.cpp
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

// External

// Project
#include "../include/FSC_CardSet.h"
#include "./FSC_CardSetData.h"
#include "./Error/FSC_ErrorInternal.h"

// Pre-defined
#ifndef FSC_CS_PRELOAD_MAX
    #define FSC_CS_PRELOAD_MAX                          5
#elif FSC_CS_PRELOAD_MAX <= 0 || FSC_CS_PRELOAD_MAX > 5
    #define FSC_CS_PRELOAD_MAX                          5
#endif


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_CardSet_t::FSC_CardSet_t(std::string const& s_DirPath,
                             std::string const& s_FilePath,
                             std::string const& s_Title,
                             size_t us_CacheLimit) : s_DirPath(s_DirPath),
                                                     s_Title(s_Title),
                                                     c_List(s_FilePath,
                                                            s_DirPath),
                                                     c_Loader(us_CacheLimit)
{
    CardSetup();
}

FSC_CardSet_t::~FSC_CardSet_t() noexcept
{}

//*************************************************************************************
// Update
//*************************************************************************************

void FSC_CardSet_t::Reload(std::string const& s_DirPath, std::string const& s_FilePath, std::string const& s_Title)
{
    // Replace card set info, but keep cache
    this->s_DirPath = s_DirPath;
    this->s_Title = s_Title;
    
    try
    {
        this->c_List = FSC_CSList(s_FilePath,
                                  s_DirPath);
        CardSetup();
    }
    catch (FSC_Exception& e)
    {
        throw;
    }
}

void FSC_CardSet_t::CardSetup() noexcept
{
    us_CardCountTotal = c_List.GetCount();
    us_CardCountRemaining = us_CardCountTotal;
    
    // Preload, if possible
    try
    {
        for (size_t i = 0; i < us_CardCountTotal && i < c_Loader.GetCacheSize(); ++i)
        {
            c_Loader.LoadCard(c_List.GetPos(i), NULL, NULL);
        }
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
    }
    
    // Used initial cards for preload, now scramble
    c_List.Scramble();
}

//*************************************************************************************
// Card Set State
//*************************************************************************************

bool FSC_CSUsable(const FSC_CardSet* p_Set)
{
    if (p_Set == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return false;
    }
    
    return true;
}

//*************************************************************************************
// Grab
//*************************************************************************************

void FSC_CSGrabCard(FSC_CardSetOpaque* p_Set, FSC_Callback p_Callback, FSC_Destination p_Destination)
{
    if (!FSC_CSUsable(p_Set))
    {
        return;
    }
    
    try
    {
        // Handle correct path creation ourselfes, loader should not be concerned about that
        p_Set->c_Loader.LoadCard(p_Set->c_List.GetNext(), p_Callback, p_Destination);
    }
    catch (FSC_Exception& e)
    {
        FSC_ESetError(FSC_ERROR_CARD_SET_NOT_CARDS);
    }
}

//*************************************************************************************
// Return
//*************************************************************************************

FSC_CardOpaque* FSC_CSReturnCard(FSC_CardSetOpaque* p_Set, FSC_CardOpaque* p_Card, int i_Completed)
{
    if (!FSC_CSUsable(p_Set) || !FSC_CDUsable(p_Card))
    {
        return p_Card;
    }
    
    if (i_Completed < 0)
    {
        // Add back, still not completed
        p_Set->c_List.Add(p_Card->s_FilePath);
        p_Set->c_List.Scramble();
    }
    else
    {
        // Reset path, meant to be overwritten
        p_Card->s_FilePath = "";
        
        // Card completed, 1 less
        if (p_Set->us_CardCountRemaining > 0)
        {
            p_Set->us_CardCountRemaining -= 1;
        }
    }
    
    p_Set->c_Loader.AddToCache(p_Card);
    return NULL;
}

//*************************************************************************************
// Getters
//*************************************************************************************

const char* FSC_CSGetTitle(const FSC_CardSetOpaque* p_Set)
{
    return FSC_CSUsable(p_Set) ? p_Set->s_Title.c_str() : NULL;
}

size_t FSC_CSGetTotalCount(const FSC_CardSetOpaque* p_Set)
{
    return FSC_CSUsable(p_Set) ? p_Set->us_CardCountTotal : 0;
}

size_t FSC_CSGetRemainingCount(const FSC_CardSetOpaque* p_Set)
{
    return FSC_CSUsable(p_Set) ? p_Set->us_CardCountRemaining : 0;
}

int FSC_CSGetFinished(const FSC_CardSetOpaque* p_Set)
{
    if (!FSC_CSUsable(p_Set))
    {
        return -1;
    }
    
    return p_Set->us_CardCountRemaining == 0 ? 0 : -1;
}

const char* FSC_NONNULL FSC_CSGetDirPath(const FSC_CardSetOpaque* FSC_NONNULL p_Set)
{
    return FSC_CSUsable(p_Set) ? p_Set->s_DirPath.c_str() : NULL;
}
