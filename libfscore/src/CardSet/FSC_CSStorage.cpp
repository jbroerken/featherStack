/**
 *  FSC_CSStorage.cpp
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
#include "./FSC_CSStorage.h"
#include "../Error/FSC_ErrorInternal.h"


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_CSStorage::FSC_CSStorage(size_t us_StorageLimit) noexcept
{
    v_Card.reserve((this->us_StorageLimit = us_StorageLimit));
}

FSC_CSStorage::~FSC_CSStorage() noexcept
{
    // NOTE: No custom deleter due to getter
    for (auto& Card : v_Card)
    {
        delete Card;
    }
}

//*************************************************************************************
// Add
//*************************************************************************************

void FSC_CSStorage::Add(FSC_Card*& p_Card)
{
    if (p_Card == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        throw FSC_Exception("Add(): Card is NULL!", "FSC_CSStorage", __LINE__);
    }
    
    // Critical starts here
    c_Mutex.lock();
    
    if (v_Card.size() == us_StorageLimit)
    {
        // Drop oldest
        delete v_Card[0];
        v_Card.erase(v_Card.begin());
    }
    else if (v_Card.size() == v_Card.capacity())
    {
        // Grow reserved space, now needed
        v_Card.reserve(v_Card.size() + us_Reserve);
    }
    
    v_Card.emplace_back(p_Card);
    
    // Critical end, p_Card is local
    c_Mutex.unlock();
    
    // Consume, belongs to us now
    p_Card = NULL;
}

//*************************************************************************************
// Getters
//*************************************************************************************

size_t FSC_CSStorage::GetCount() noexcept
{
    std::lock_guard<std::mutex> c_Guard(c_Mutex);
    return v_Card.size();
}

bool FSC_CSStorage::GetFull() noexcept
{
    std::lock_guard<std::mutex> c_Guard(c_Mutex);
    return v_Card.size() == us_StorageLimit;
}

FSC_Card* FSC_CSStorage::GetNext()
{
    c_Mutex.lock();
    
    if (v_Card.size() == 0)
    {
        c_Mutex.unlock();
        throw FSC_Exception("GetNext(): No Cards!", "FSC_CSStorage", __LINE__);
    }
    
    // Grab oldest
    FSC_Card* p_Result = v_Card[0];
    v_Card.erase(v_Card.begin());
    
    c_Mutex.unlock();
    return p_Result;
}

FSC_Card* FSC_CSStorage::GetPath(std::string const& s_FilePath)
{
    c_Mutex.lock();
    
    for (size_t i = 0; i < v_Card.size(); ++i)
    {
        if (s_FilePath.compare(v_Card[i]->s_FilePath) == 0)
        {
            FSC_Card* p_Card = v_Card[i];
            v_Card.erase(v_Card.begin() + i);
            
            c_Mutex.unlock();
            return p_Card;
        }
    }
    
    c_Mutex.unlock();
    throw FSC_Exception("GetPath(): No Card by path " + s_FilePath + "!", "FSC_CSStorage", __LINE__);
}

size_t FSC_CSStorage::GetStorageLimit() noexcept
{
    // No need for a lock, value never changes
    return us_StorageLimit;
}
