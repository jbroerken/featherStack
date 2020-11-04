/**
 *  FSC_CardList.h
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

#ifndef FSC_CSList_h
#define FSC_CSList_h

// C++ / C
#include <vector>

// External

// Project
#include "../Error/FSC_Exception.h"


class FSC_CSList
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Card list file constructor.
     *
     *  \param s_FilePath The file name of the card list file.
     *  \param s_DirPath The directory path to the card set.
     */
    
    FSC_CSList(std::string const& s_FilePath,
               std::string const& s_DirPath);
    
    /**
     *  Card list copy constructor.
     *
     *  \param c_List The source class to copy.
     */
    
    FSC_CSList(FSC_CSList const& c_List) noexcept;
    
    /**
     *  Card list destructor.
     */
    
    ~FSC_CSList() noexcept;
    
    //*************************************************************************************
    // Scramble
    //*************************************************************************************
    
    /**
     *  Scramble the list, rearanging the card order.
     */
    
    void Scramble() noexcept;
    
    //*************************************************************************************
    // Add
    //*************************************************************************************
    
    /**
     *  Add a card list file path. This will scramble the list.
     *
     *  \param s_FilePath The path to add.
     */
    
    void Add(std::string const& s_FilePath) noexcept;
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************
    
    /**
     *  Get a specific card file path.
     *
     *  \param us_Card The card file path index.
     *
     *  \return The requested card file path.
     */
    
    std::string GetPos(size_t us_Card);
    
    /**
     *  Get the next (first) card file path, removing it from the list.
     *
     *  \return The next card file path.
     */
    
    std::string GetNext();
    
    /**
     *  Get the current card file path count.
     *
     *  \return The current card file path count.
     */
    
    size_t GetCount() noexcept;
    
private:
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::vector<std::string> v_List;
    
protected:
    
};

#endif /* FSC_CSList_h */
