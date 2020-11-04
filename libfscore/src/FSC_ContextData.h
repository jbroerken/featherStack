/**
 *  FSC_ContextData.h
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

#ifndef FSC_ContextData_h
#define FSC_ContextData_h

// C++ / C
#include <vector>
#include <string>
#include <utility>
#include <stdint.h>

// External

// Project
#include "./FSC_CardSetData.h"


//*************************************************************************************
// Types
//*************************************************************************************

typedef struct FSC_Entry_t
{
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Context constructor.
     */
    
    FSC_Entry_t() noexcept;
    
    /**
     *  Context destructor.
     */
    
    ~FSC_Entry_t() noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_DirPath;
    std::string s_FilePath;
    std::string s_IconPath;
    
    std::string s_Title;
    std::string s_Subtitle;
    
}FSC_Entry;

typedef struct FSC_Context_t
{
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Context constructor.
     *
     *  \param s_DirPath The path of the context data.
     *  \param s_FilePath The path of the context file.
     */
    
    FSC_Context_t(std::string const& s_DirPath,
                  std::string const& s_FilePath,
                  size_t us_CacheLimit) noexcept;
    
    /**
     *  Context destructor.
     */
    
    ~FSC_Context_t() noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_DirPath;
    std::string s_FilePath;
    
    size_t us_CacheLimit;
    
    std::vector<FSC_Entry> v_List;
    FSC_CardSet* p_Set; // The currently active set
    
}FSC_Context;

#endif /* FSC_ContextData_h */
