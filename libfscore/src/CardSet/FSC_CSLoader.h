/**
 *  FSC_CSLoader.h
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

#ifndef FSC_CSLoader_h
#define FSC_CSLoader_h

// C++ / C
#include <thread>
#include <condition_variable>
#include <mutex>
#include <atomic>
#include <list>
#include <utility>

// External

// Project
#include "./FSC_CSStorage.h"
#include "../../include/FSC_CardSet.h"


class FSC_CSLoader
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Card list constructor.
     *
     *  \param us_CacheLimit The maximum amount of cards persisting in memory.
     */
    
    FSC_CSLoader(size_t us_CacheLimit);
    
    /**
     *  Copy constructor. Disabled for this class.
     *
     *  \param c_Loader The source class to copy.
     */
    
    FSC_CSLoader(FSC_CSLoader const& c_Loader) noexcept = delete;
    
    /**
     *  Card list destructor.
     */
    
    ~FSC_CSLoader() noexcept;
    
    //*************************************************************************************
    // Add Card
    //*************************************************************************************
    
    /**
     *  Add a card to the cache container, allowing to immediatly retrieve it. This function is thread safe.
     *
     *  \param p_Card The card to add. The pointer is consumed on success.
     */
    
    void AddToCache(FSC_Card*& p_Card) noexcept;
    
    //*************************************************************************************
    // Load Card
    //*************************************************************************************
    
    /**
     *  Load a requested card. This function is thread safe.
     *
     *  \param s_FilePath The file path to the card file requested.
     *  \param p_Callback The callback for the card loading result.
     *  \param p_Destination The card destination to pass to the callback.
     */
    
    void LoadCard(std::string const& s_FilePath, FSC_Callback p_Callback, FSC_Destination p_Destination) noexcept;
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************

    /**
     *  Get the maximum cache size. This function is thread safe.
     *
     *  \return The maximum cache size.
     */
    
    size_t GetCacheSize() noexcept;
    
private:
    
    //*************************************************************************************
    // Types
    //*************************************************************************************
    
    class JobList
    {
    public:
        
        //*************************************************************************************
        // Constructor / Destructor
        //*************************************************************************************
        
        /**
         *  Job list constructor.
         */
        
        JobList() noexcept;
        
        /**
         *  Job list destructor.
         */
        
        ~JobList() noexcept;
        
        //*************************************************************************************
        // Job
        //*************************************************************************************
        
        /**
         *  Add a job. This function is thread safe.
         *
         *  \param p_Callback The callback for the card load.
         *  \param p_Destination The card destination to pass to the callback.
         *  \param s_FilePath The path to the card file to load.
         *  \param b_Front Wether to add the job at the start of the job list (next task) or not.
         */
        
        void Add(FSC_Callback const& p_Callback, FSC_Destination& p_Destination, std::string const& s_FilePath, bool b_Front = false) noexcept;
        
        /**
         *  Claim a job, removing it from the job list. This function is thread safe.
         *
         *  \param p_Callback A reference to the callback to store the card adress in.
         *  \param p_Destination The card destination to pass to the callback.
         *  \param s_FilePath A reference to the file path location to write to.
         *
         *  \return true if a job was claimed, false if not.
         */
        
        bool Claim(FSC_Callback& p_Callback, FSC_Destination& p_Destination, std::string& s_FilePath) noexcept;
        
    private:
        
        //*************************************************************************************
        // Data
        //*************************************************************************************
        
        std::mutex c_Mutex;
        
        std::list<std::pair<std::pair<FSC_Callback, FSC_Destination>, std::string>> l_Job;
        
    protected:
        
    };
    
    //*************************************************************************************
    // Thread
    //*************************************************************************************
    
    /**
     *  Copy string data and terminate.
     *
     *  \param p_Card The card to setup.
     *  \param s_FilePath The path to the card value file.
     */
    
    static void ThreadCardSetup(FSC_Card* p_Card, std::string const& s_FilePath);
    
    /**
     *  Load cards thread function.
     */
    
    static void ThreadLoad(FSC_CSLoader* p_Instance) noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    // Thread management
    std::vector<std::thread> v_Thread;
    std::atomic<bool> b_Stop;
    
    std::condition_variable c_Condition;
    std::mutex c_ConditionMutex;
    
    JobList c_JobList;
    
    // Storing of reusable (to overwrite with new data) and returnable cards
    FSC_CSStorage c_Cache;
    
protected:
    
};

#endif /* FSC_CSLoader_h */
