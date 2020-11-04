/**
 *  FSC_CSList.cpp
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
#include <random>
#include <locale>
#include <codecvt>

// External

// Project
#include "./FSC_CSList.h"
#include "../File/FSC_ValueFile.h"

// Pre-defined
#ifndef FSC_CSL_RESCRAMBLE_MAX
    #define FSC_CSL_RESCRAMBLE_MAX              3
#elif FSC_CSL_RESCRAMBLE_MAX < 0 || FSC_CSL_RESCRAMBLE_MAX > 255
    #define FSC_CSL_RESCRAMBLE_MAX              3
#endif

namespace
{
    const char* p_BlockName = "Cards";
    const char* p_Identifier = "File";
}


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_CSList::FSC_CSList(std::string const& s_FilePath,
                       std::string const& s_DirPath)
{
    try
    {
        FSC_ValueFile c_File(s_FilePath);
        
        // Search for the first block matching our description
        for (auto& Block : c_File.v_Block)
        {
            if (Block.s_Name.compare(p_BlockName) != 0)
            {
                continue;
            }
            
            // Add all card file entries
            for (auto& Value : Block.v_Value)
            {
                if (Value.first.compare(p_Identifier) == 0)
                {
                    v_List.emplace_back(s_DirPath + Value.second);
                }
            }
            
            // Only stop if a block contained at least 1 card
            if (v_List.size() > 0)
            {
                break;
            }
        }
    }
    catch (FSC_Exception& e)
    {
        throw;
    }
}

FSC_CSList::FSC_CSList(FSC_CSList const& c_List) noexcept : v_List(c_List.v_List)
{}

FSC_CSList::~FSC_CSList() noexcept
{}

//*************************************************************************************
// Scramble
//*************************************************************************************

void FSC_CSList::Scramble() noexcept
{
    if (v_List.size() < 2)
    {
        return;
    }
    
    std::random_device c_Random;
    std::mt19937 c_Pseudo(c_Random());
    std::shuffle(v_List.begin(), v_List.end(), c_Pseudo);
}

//*************************************************************************************
// Add
//*************************************************************************************

void FSC_CSList::Add(std::string const& s_FilePath) noexcept
{
    v_List.emplace_back(s_FilePath);
    
    // Single item, no need to scramble
    if (v_List.size() == 1)
    {
        return;
    }
    
    // Scramble while last added item is in first place
    for (uint8_t i = 0; i < FSC_CSL_RESCRAMBLE_MAX && v_List[0].compare(s_FilePath) == 0; ++i)
    {
        Scramble();
    }
}

//*************************************************************************************
// Getters
//*************************************************************************************

std::string FSC_CSList::GetPos(size_t us_Card)
{
    if (v_List.size() <= us_Card)
    {
        throw FSC_Exception("GetPos(): No cards!", "FSC_CSList", __LINE__);
    }
    
    return v_List[us_Card];
}

std::string FSC_CSList::GetNext()
{
    try
    {
        std::string s_Result = GetPos(0);
        v_List.erase(v_List.begin());
        
        return s_Result;
    }
    catch (FSC_Exception& e)
    {
        throw;
    }
}

size_t FSC_CSList::GetCount() noexcept
{
    return v_List.size();
}
