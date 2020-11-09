/**
 *  FSC_ImportFileData.h
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
#include <vector>

// External

// Project
#include "./Error/FSC_Exception.h"

// Pre-defined
#define FSC_IFD_STR_MAX_LENGTH                       511


//*************************************************************************************
// Type
//*************************************************************************************

typedef struct FSC_ImportFile_t
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Import file constructor.
     *
     *  \param s_FilePath The path to the import file.
     */
    
    FSC_ImportFile_t(std::string const& s_FilePath);
    
    /**
     *  Import file destructor.
     */
    
    ~FSC_ImportFile_t() noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_SetFile;
    std::string s_DirName;
    
    std::vector<std::string> v_FilePath;
    
private:
    
protected:
    
}FSC_ImportFile;

#endif /* FSC_ImportFileData_h */
