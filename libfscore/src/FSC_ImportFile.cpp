/**
 *  FSC_ImportFile.cpp
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
#include <cerrno>
#include <fstream>

// External

// Project
#include "../include/FSC_ImportFile.h"
#include "./FSC_ImportFileData.h"
#include "./Error/FSC_ErrorInternal.h"

// Pre-defined
#ifndef FSC_IF_LINE_MAX
    #define FSC_IF_LINE_MAX                             500
#elif FSC_IF_LINE_MAX <= 0
    #define FSC_IF_LINE_MAX                             3 // Min, Name Dir and 1 file
#elif FSC_IF_LINE_MAX > 500
    #define FSC_IF_LINE_MAX                             500
#endif

namespace
{
    enum Identifier
    {
        SET_FILE = 0,
        DIR_NAME = 1,
        FILE_PATH = 2,
        
        IDENTIFIER_MAX = FILE_PATH,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1
    };
    
    const char* p_Identifier[IDENTIFIER_COUNT] =
    {
        "SetFile=",
        "Directory=",
        "File="
    };
}


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_ImportFile_t::FSC_ImportFile_t(std::string const& s_FilePath) : s_SetFile(""),
                                                                    s_DirName("")
{
    std::ifstream f_File(s_FilePath);
    std::string s_Line;
    size_t us_Line = 0;
    size_t us_Length;
    size_t us_IdentifierStart = SET_FILE;
    
    if (!f_File.is_open())
    {
        throw FSC_Exception("FSC_ImportFile_t(): Failed to open file " + s_FilePath + "!", "FSC_ImportFile", __LINE__);
    }
    
    while (us_Line < FSC_IF_LINE_MAX && getline(f_File, s_Line))
    {
        // Increment first, count comment lines as well
        ++us_Line;
        
        // Ignore comments and empty lines
        if (s_Line.length() == 0 || s_Line[0] == '#' || s_Line[0] == '\n' || s_Line[0] == '\r')
        {
            continue;
        }
        
        // Check all identifiers
        for (size_t i = us_IdentifierStart; i < IDENTIFIER_COUNT; ++i)
        {
            try
            {
                if (s_Line.length() > (us_Length = std::strlen(p_Identifier[i])) &&
                    s_Line.substr(0, us_Length).compare(p_Identifier[i]) == 0)
                {
                    switch (i)
                    {
                        case SET_FILE:
                            s_SetFile = s_Line.substr(us_Length);
                            us_IdentifierStart = (s_DirName.length() > 0 ? FILE_PATH : SET_FILE); // SetFile already > 0
                            break;
                        case DIR_NAME:
                            s_DirName = s_Line.substr(us_Length);
                            us_IdentifierStart = (s_SetFile.length() > 0 ? FILE_PATH : SET_FILE); // DirName already > 0
                            break;
                        case FILE_PATH:
                            v_FilePath.emplace_back(s_Line.substr(us_Length));
                            break;
                    }
                }
            }
            catch (std::exception& e)
            {
                f_File.close();
                throw;
            }
        }
    }
    
    f_File.close();
    
    // Final check
    if (s_SetFile.length() == 0 || s_SetFile.length() > FSC_IFD_STR_MAX_LENGTH ||
        s_DirName.length() == 0 || s_DirName.length() > FSC_IFD_STR_MAX_LENGTH)
    {
        throw FSC_Exception("FSC_ImportFile_t(): Failed to read file " + s_FilePath + "!", "FSC_ImportFile", __LINE__);
    }
}

FSC_ImportFile_t::~FSC_ImportFile_t() noexcept
{}

//*************************************************************************************
// Import File State
//*************************************************************************************

static bool FSC_IFUsable(const FSC_ImportFile* p_File)
{
    if (p_File == NULL ||
        p_File->s_SetFile.length() == 0 || p_File->s_SetFile.length() > FSC_IFD_STR_MAX_LENGTH ||
        p_File->s_DirName.length() == 0 || p_File->s_DirName.length() > FSC_IFD_STR_MAX_LENGTH)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return false;
    }
    
    return true;
}

//*************************************************************************************
// Create
//*************************************************************************************

FSC_ImportFileOpaque* FSC_IFCreate(const char* p_FilePath)
{
    if (p_FilePath == NULL || std::strlen(p_FilePath) == 0 || std::strlen(p_FilePath) > FSC_IFD_STR_MAX_LENGTH)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return NULL;
    }
    
    try
    {
        return new FSC_ImportFile_t(p_FilePath);
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
    }
    catch (std::bad_alloc& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_GENERAL_MALLOC);
    }
    catch (std::exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_UNK);
    }
    
    return NULL;
}

//*************************************************************************************
// Destroy
//*************************************************************************************

FSC_ImportFileOpaque* FSC_IFDestroy(FSC_ImportFileOpaque* p_File)
{
    if (!FSC_IFUsable(p_File))
    {
        return p_File;
    }
    
    delete p_File;
    return NULL;
}

//*************************************************************************************
// Getters
//*************************************************************************************

const char* FSC_IFGetSetFile(const FSC_ImportFileOpaque* p_File)
{
    return FSC_IFUsable(p_File) ? p_File->s_SetFile.c_str() : NULL;
}

const char* FSC_IFGetDirName(const FSC_ImportFileOpaque* p_File)
{
    return FSC_IFUsable(p_File) ? p_File->s_DirName.c_str() : NULL;
}

size_t FSC_IFGetFileCount(const FSC_ImportFileOpaque* p_File)
{
    return FSC_IFUsable(p_File) ? p_File->v_FilePath.size() : 0;
}

const char* FSC_IFGetFilePath(const FSC_ImportFileOpaque* p_File, size_t us_File)
{
    if (!FSC_IFUsable(p_File))
    {
        return NULL;
    }
    else if (us_File >= p_File->v_FilePath.size())
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return NULL;
    }
    
    return p_File->v_FilePath[us_File].c_str();
}
