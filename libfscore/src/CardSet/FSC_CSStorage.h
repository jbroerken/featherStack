/**
 *  FSC_CSStorage.h
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

#ifndef FSC_CSStorage_h
#define FSC_CSStorage_h

// C++ / C
#include <mutex>

// External

// Project
#include "../FSC_CardData.h"
#include "../Error/FSC_Exception.h"


class FSC_CSStorage
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Card storage constructor.
     *
     *  \param us_StorageLimit The maximum amount of cards stored at a given time.
     */
    
    FSC_CSStorage(size_t us_StorageLimit) noexcept;
    
    /**
     *  Copy constructor. Disabled for this class.
     *
     *  \param c_Storage The source class to copy.
     */
    
    FSC_CSStorage(FSC_CSStorage const& c_Storage) noexcept = delete;
    
    /**
     *  Card storage destructor.
     */
    
    ~FSC_CSStorage() noexcept;
    
    //*************************************************************************************
    // Add
    //*************************************************************************************
    
    /**
     *  Add a card. This function is thread safe.
     *
     *  \param p_Card The card to add. This pointer is consumed on success.
     */
    
    void Add(FSC_Card*& p_Card);
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************
    
    /**
     *  Get the maximum amount of cards stored. This function is thread safe.
     *
     *  \return The maximum amount of cards stored at a time.
     */
    
    size_t GetStorageLimit() noexcept;
    
    /**
     *  Get the amount of cards stored. This function is thread safe.
     *
     *  \return The amount of cards stored.
     */
    
    size_t GetCount() noexcept;
    
    /**
     *  Check if the storage is full or not. This function is thread safe.
     *
     *  \return true if full, false if not.
     */
    
    bool GetFull() noexcept;
    
    /**
     *  Get the oldest stored card, removing it from the list. This function is thread safe.
     *
     *  \return The requested card.
     */
    
    FSC_Card* GetNext();
    
    /**
     *  Get a card by file name, removing it from the list. This function is thread safe.
     *
     *  \param s_FilePath The file path of the card.
     *
     *  \return The requested card.
     */
    
    FSC_Card* GetPath(std::string const& s_FilePath);
    
private:
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::mutex c_Mutex;
    
    std::vector<FSC_Card*> v_Card;
    
    size_t us_StorageLimit;
    size_t us_Reserve;
    
protected:
    
};

#endif /* FSC_CSStorage_h */
