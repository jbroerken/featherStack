/**
 *  FSC_Context.cpp
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
#include <locale>
#include <codecvt>

// External

// Project
#include "../include/FSC_Context.h"
#include "./FSC_ContextData.h"
#include "./File/FSC_ValueFile.h"
#include "./Error/FSC_ErrorInternal.h"

// Pre-defined
namespace
{
    enum Identifier
    {
        TITLE = 0,
        SUBTITLE = 1,
        DIRECTORY = 2,
        SET_FILE = 3,
        ICON_FILE = 4,
        
        IDENTIFIER_MAX = ICON_FILE,
        
        IDENTIFIER_COUNT = IDENTIFIER_MAX + 1
    };
    
    const char* p_Identifier[IDENTIFIER_COUNT] =
    {
        "Title",
        "Subtitle",
        "Directory",
        "Set_File",
        "Icon_File",
    };
    
    const char* p_BlockName = "CardSet";
}


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_Context_t::FSC_Context_t(std::string const& s_DirPath,
                             std::string const& s_FilePath,
                             size_t us_CacheLimit) noexcept : s_DirPath(s_DirPath),
                                                              s_FilePath(s_FilePath)
{
    this->us_CacheLimit = us_CacheLimit;
    p_Set = NULL;
}

FSC_Context_t::~FSC_Context_t() noexcept
{
    if (p_Set != NULL)
    {
        delete p_Set;
    }
}

FSC_Entry_t::FSC_Entry_t() noexcept : s_DirPath(""),
                                      s_FilePath(""),
                                      s_IconPath(""),
                                      s_Title(""),
                                      s_Subtitle("")
{}

FSC_Entry_t::~FSC_Entry_t() noexcept
{}

//*************************************************************************************
// Create
//*************************************************************************************

static void FSC_COAddEntry(std::vector<FSC_Entry>& v_List, FSC_ValueFile::Block& c_Block, std::string const& s_DirPath) noexcept
{
    FSC_Entry s_Entry;
    
    try
    {
        if ((s_Entry.s_Title = c_Block.GetValue(p_Identifier[TITLE])).length() == 0 ||
            (s_Entry.s_Subtitle = c_Block.GetValue(p_Identifier[SUBTITLE])).length() == 0 ||
            (s_Entry.s_DirPath = s_DirPath + c_Block.GetValue(p_Identifier[DIRECTORY])).length() == 0)
        {
            throw FSC_Exception("FSC_COAddEntry(): Failed to add entry!", "FSC_Context", __LINE__);
        }
        
        if (*(s_Entry.s_DirPath.end() - 1) != '/')
        {
            s_Entry.s_DirPath += "/";
        }
        
        size_t s_Length = s_Entry.s_DirPath.length();
        
        if ((s_Entry.s_FilePath = s_Entry.s_DirPath + c_Block.GetValue(p_Identifier[SET_FILE])).length() == s_Length ||
            (s_Entry.s_IconPath = s_Entry.s_DirPath + c_Block.GetValue(p_Identifier[ICON_FILE])).length() == s_Length)
        {
            throw FSC_Exception("FSC_COAddEntry(): Failed to add entry!", "FSC_Context", __LINE__);
        }
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        return;
    }
    
    v_List.emplace_back(s_Entry);
}

FSC_ContextOpaque* FSC_COCreate(const char* p_DirPath, const char* p_FileName, size_t us_CacheLimit)
{
    if (p_DirPath == NULL || std::strlen(p_DirPath) == 0 ||
        p_FileName == NULL || std::strlen(p_FileName) == 0 ||
        us_CacheLimit == 0)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return NULL;
    }
    
    try
    {
        // Grab files first, without new
        std::string s_DirPath(p_DirPath);
        std::string s_FileName(p_FileName);
        
        if (*(s_DirPath.end() - 1) != '/')
        {
            s_DirPath += "/";
        }
        
        FSC_ValueFile c_File = FSC_ValueFile(s_DirPath + s_FileName);
        
        // Create context
        FSC_Context* p_Context = new FSC_Context(s_DirPath,
                                                 s_DirPath + s_FileName,
                                                 us_CacheLimit);
        
        // Add list entries
        for (auto& Block : c_File.v_Block)
        {
            if (Block.s_Name.compare(p_BlockName) == 0)
            {
                FSC_COAddEntry(p_Context->v_List, Block, s_DirPath);
            }
        }
        
        return p_Context;
    }
    catch (std::bad_alloc& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_GENERAL_MALLOC);
        return NULL;
    }
    catch (std::exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_UNK);
        return NULL;
    }
}

//*************************************************************************************
// Destroy
//*************************************************************************************

FSC_ContextOpaque* FSC_CODestroy(FSC_ContextOpaque* p_Context)
{
    if (p_Context == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return NULL;
    }
    
    delete p_Context;
    return NULL;
}

//*************************************************************************************
// Current Set
//*************************************************************************************

FSC_CardSetOpaque* FSC_COCreateSet(FSC_ContextOpaque* p_Context, size_t us_Set)
{
    if (p_Context == NULL || p_Context->v_List.size() <= us_Set)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return NULL;
    }
    
    // Create a current set if none was found
    FSC_CardSet* p_Set;
    auto It = p_Context->v_List.begin() + us_Set;
    
    try
    {
        if (p_Context->p_Set == NULL)
        {
            p_Set = new FSC_CardSet(It->s_DirPath,
                                    It->s_FilePath,
                                    It->s_Title,
                                    p_Context->us_CacheLimit);
        }
        else
        {
            p_Set = p_Context->p_Set;
            p_Context->p_Set = NULL; // Given out, do not remember!
            
            // Update card, new info requested
            p_Set->Reload(It->s_DirPath,
                          It->s_FilePath,
                          It->s_Title);
        }
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        p_Set = NULL;
    }
    
    return p_Set;
}

FSC_CardSetOpaque* FSC_CODestroySet(FSC_ContextOpaque* p_Context, FSC_CardSetOpaque* p_Set)
{
    if (p_Context == NULL || p_Set == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return p_Set;
    }
    
    // We actually keep the set, so that the next set creation turns out to be
    // a lot faster (card set uses threads).
    if (p_Context->p_Set != NULL)
    {
        delete p_Context->p_Set;
    }
    
    p_Context->p_Set = p_Set;
    return NULL;
}

//*************************************************************************************
// Set List
//*************************************************************************************

int FSC_COAddSet(FSC_ContextOpaque* FSC_NONNULL p_Context, const char* FSC_NONNULL p_SetFile)
{
    if (p_Context == NULL || p_SetFile == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return -1;
    }
    
    // Load the context file and add the set entry
    try
    {
        FSC_ValueFile c_Context(p_Context->s_FilePath);
        FSC_ValueFile c_Import(p_SetFile);
        
        // Move the first matching block and write
        for (size_t i = 0; i < c_Import.v_Block.size(); ++i)
        {
            if (c_Import.v_Block[i].s_Name.compare(p_BlockName) == 0)
            {
                // Add entry first, invalid info triggers catch so we're not adding the
                // new invalid block
                FSC_COAddEntry(p_Context->v_List, c_Import.v_Block[i], p_Context->s_DirPath);
                c_Context.v_Block.emplace_back(std::move(c_Import.v_Block[i]));
                break;
            }
        }
        
        // Added, now overwrite the file
        c_Context.Write(p_Context->s_FilePath);
        return 0;
    }
    catch (FSC_Exception& e)
    {
        printf("[ fscore ]: %s\n", e.what()); // @TODO: Better Logging
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return -1;
    }
}

int FSC_CORemoveSet(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set)
{
    if (p_Context == NULL || p_Context->v_List.size() <= us_Set)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return -1;
    }
    
    // Load the context file and remove the set entry
    try
    {
        FSC_ValueFile c_File(p_Context->s_FilePath);
        
        std::vector<FSC_ValueFile::Block>& v_Block = c_File.v_Block;
        FSC_Entry& c_Entry = p_Context->v_List[us_Set];
        
        bool b_Match[2];
        std::string s_Corrected;
        
        for (size_t i = 0; i < v_Block.size(); ++i)
        {
            // Reset matches
            b_Match[0] = false;
            b_Match[1] = false;
            
            // Loop values, we need the name
            for (auto& Value : v_Block[i].v_Value)
            {
                if (Value.first.compare(p_Identifier[DIRECTORY]) == 0)
                {
                    s_Corrected = c_Entry.s_DirPath.substr(p_Context->s_DirPath.length());
                    
                    if (*(s_Corrected.end() - 1) == '/')
                    {
                        s_Corrected.erase(s_Corrected.end() - 1);
                    }
                    
                    if (Value.second.compare(s_Corrected) == 0 &&
                        (b_Match[0] = true) && b_Match[1])
                    {
                        break;
                    }
                }
                else if (Value.first.compare(p_Identifier[SET_FILE]) == 0)
                {
                    s_Corrected = c_Entry.s_FilePath.substr(c_Entry.s_DirPath.length());
                    
                    if (Value.second.compare(s_Corrected) == 0 &&
                        (b_Match[1] = true) && b_Match[0])
                    {
                        break;
                    }
                }
            }
            
            // All values matched, this block has to be removed.
            if (b_Match[0] && b_Match[1])
            {
                v_Block.erase(v_Block.begin() + i);
                p_Context->v_List.erase(p_Context->v_List.begin() + i); // Also remove from loaded context
                
                // We only remove the first matching entry, a duplicate entry
                // would be found as a duplicate in v_List.
                break;
            }
        }
        
        // Removed, now overwrite the file
        c_File.Write(p_Context->s_FilePath);
        return 0;
    }
    catch (FSC_Exception& e)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return -1;
    }
}

//*************************************************************************************
// Getters
//*************************************************************************************

size_t FSC_COGetSetCount(FSC_ContextOpaque* p_Context)
{
    if (p_Context == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        throw FSC_Exception("FSC_COGetEntry(): No entry!", "FSC_Context", __LINE__);
    }
    
    return p_Context->v_List.size();
}

static inline FSC_Entry const& FSC_COGetEntry(const FSC_Context* p_Context, size_t us_Set)
{
    if (p_Context == NULL || p_Context->v_List.size() <= us_Set)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        throw FSC_Exception("FSC_COGetEntry(): No entry!", "FSC_Context", __LINE__);
    }
    
    return p_Context->v_List[us_Set];
}

const char* FSC_COGetSetTitle(FSC_ContextOpaque* p_Context, size_t us_Set)
{
    try
    {
        return FSC_COGetEntry(p_Context, us_Set).s_Title.c_str();
    }
    catch (FSC_Exception& e)
    {
        return NULL;
    }
}

const char* FSC_COGetSetSubtitle(FSC_ContextOpaque* p_Context, size_t us_Set)
{
    try
    {
        return FSC_COGetEntry(p_Context, us_Set).s_Subtitle.c_str();
    }
    catch (FSC_Exception& e)
    {
        return NULL;
    }
}

const char* FSC_COGetSetDirPath(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set)
{
    try
    {
        return FSC_COGetEntry(p_Context, us_Set).s_DirPath.c_str();
    }
    catch (FSC_Exception& e)
    {
        return NULL;
    }
}

const char* FSC_NULLABLE FSC_COGetSetFilePath(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set)
{
    try
    {
        return FSC_COGetEntry(p_Context, us_Set).s_FilePath.c_str();
    }
    catch (FSC_Exception& e)
    {
        return NULL;
    }
}

const char* FSC_COGetSetIconPath(FSC_ContextOpaque* p_Context, size_t us_Set)
{
    try
    {
        return FSC_COGetEntry(p_Context, us_Set).s_IconPath.c_str();
    }
    catch (FSC_Exception& e)
    {
        return NULL;
    }
}
