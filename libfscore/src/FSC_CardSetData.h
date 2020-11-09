/**
 *  FSC_CardSetData.h
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

#ifndef FSC_CardSetData_h
#define FSC_CardSetData_h

// C++ / C

// External

// Project
#include "./CardSet/FSC_CSLoader.h"
#include "./CardSet/FSC_CSList.h"

// Pre-defined
#define FSC_CSD_STR_MAX_LENGTH                       511


//*************************************************************************************
// Type
//*************************************************************************************

typedef struct FSC_CardSet_t
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Card set constructor.
     *
     *  \param s_DirPath The path to the card set directory.
     *  \param s_FilePath The path of the card set file.
     *  \param s_Title The title of the card set.
     *  \param us_CacheLimit The maximum amount of cards stored at a given time.
     */
    
    FSC_CardSet_t(std::string const& s_DirPath,
                  std::string const& s_FilePath,
                  std::string const& s_Title,
                  size_t us_CacheLimit);
    
    /**
     *  Card set destructor.
     */
    
    ~FSC_CardSet_t() noexcept;
    
    //*************************************************************************************
    // Update
    //*************************************************************************************
    
    /**
     *  Reload the card set.
     *
     *  \param s_DirPath The path to the card set directory.
     *  \param s_FilePath The path of the card set file.
     *  \param s_Title The title of the card set.
     */
    
    void Reload(std::string const& s_DirPath, std::string const& s_FilePath, std::string const& s_Title);
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_DirPath;
    
    std::string s_Title;
    
    size_t us_CardCountTotal;
    size_t us_CardCountRemaining; // Different from list count, keeps track of uncompleted cards
    
    FSC_CSLoader c_Loader;
    FSC_CSList c_List;
    
private:
    
    //*************************************************************************************
    // Update
    //*************************************************************************************
    
    /**
     *  Set the card count and fill the cache with pre-loaded items.
     */
    
    void CardSetup() noexcept;
    
protected:
    
}FSC_CardSet;

//*************************************************************************************
// Card Set State
//*************************************************************************************

/**
 *  Check if a card set is in a usable state.
 *
 *  \param p_Set The card set to check.
 *
 *  \return true if usable, false if not.
 */

extern bool FSC_CSUsable(const FSC_CardSet* p_Set);

#endif /* FSC_CardSetData_h */
