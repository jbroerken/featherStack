/**
 *  FSC_ValueFile.cpp
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
#include <fstream>
#include <locale>
#include <codecvt>

// External

// Project
#include "./FSC_ValueFile.h"


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_ValueFile::FSC_ValueFile(std::string const& s_FilePath)
{
    try
    {
        Read(s_FilePath);
    }
    catch (FSC_Exception& e)
    {
        throw;
    }
}

FSC_ValueFile::~FSC_ValueFile() noexcept
{}

FSC_ValueFile::Block::Block(std::string const& s_Name) noexcept : s_Name(s_Name)
{}

FSC_ValueFile::Block::~Block() noexcept
{}

//*************************************************************************************
// Read
//*************************************************************************************

inline bool FSC_ValueFile::IsBlockStart(std::string const& s_Line) noexcept
{
    size_t us_End = s_Line.find("\" = {", s_Line.size() - 5);
    
    // Check block name existence and create
    if (s_Line[0] == L'"' && us_End != std::string::npos && us_End > 1)
    {
        v_Block.emplace_back(s_Line.substr(1, us_End - 1));
        return true;
    }
    
    return false;
}

inline bool FSC_ValueFile::IsBlockEnd(std::string const& s_Line) noexcept
{
    return s_Line[0] == '}' ? true : false;
}

inline void FSC_ValueFile::ReadValue(std::string const& s_Line) noexcept
{
    size_t p_Pos[4]; // 0 = ID Start, 1 = ID End, 2 = Value Start, 3 = Value End
    
    // Grab the identifier position info
    if ((p_Pos[0] = s_Line.find_first_of('"')) == std::wstring::npos ||
        (p_Pos[1] = s_Line.find("\" = \"")) == std::wstring::npos ||
        p_Pos[1] <= p_Pos[0] + 1) /* Length check, do before value check */
    {
        printf("[ fscore ]: Unreadable Identifier\n"); // @TODO: Better Logging
        return;
    }
    
    // Grab the value position info
    // NOTE: Empty strings are valid!
    if ((p_Pos[2] = s_Line.find_first_of('"', p_Pos[1] + 4)) == std::wstring::npos || // +3 = " = "
        (p_Pos[3] = s_Line.find_last_of('"')) == std::wstring::npos)
    {
        printf("[ fscore ]: Unreadable Value\n"); // @TODO: Better Logging
        return;
    }
    
    // Correct start (was '"') and set length
    p_Pos[0] += 1;
    p_Pos[1] -= p_Pos[0];
    
    p_Pos[2] += 1;
    p_Pos[3] -= p_Pos[2];
    
    // Add value on valid identifier
    std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> convert;
    (v_Block.end() - 1)->v_Value.emplace_back(std::make_pair(s_Line.substr(p_Pos[0], p_Pos[1]),
                                                             s_Line.substr(p_Pos[2], p_Pos[3])));
}

void FSC_ValueFile::Read(std::string const& s_FilePath)
{
    std::ifstream f_File(s_FilePath);
    
    if (!f_File.is_open())
    {
        throw FSC_Exception("Read(): Failed to open file " + s_FilePath + "!", "FSC_ValueFile", __LINE__);
    }
    
    std::string s_Line;
    bool b_InBlock = false;
    
    while (getline(f_File, s_Line))
    {
        // Ignore comments and empty lines
        if (s_Line.length() == 0 || s_Line[0] == '#' || s_Line[0] == '\n' || s_Line[0] == '\r')
        {
            continue;
        }
        
        if (b_InBlock)
        {
            // Currently in block, end or add values?
            if ((b_InBlock = !IsBlockEnd(s_Line)))
            {
                ReadValue(s_Line);
            }
        }
        else
        {
            b_InBlock = IsBlockStart(s_Line);
        }
    }
    
    f_File.close();
    
    // We should have left the last block after reading the file!
    if (b_InBlock)
    {
        throw FSC_Exception("Read(): EOF before block end!", "FSC_ValueFile", __LINE__);
    }
}

//*************************************************************************************
// Write
//*************************************************************************************

void FSC_ValueFile::Write(std::string const& s_FilePath)
{
    std::ofstream f_File(s_FilePath);
    
    if (!f_File.is_open())
    {
        throw FSC_Exception("Write(): Failed to open file " + s_FilePath + "!", "FSC_ValueFile", __LINE__);
    }
    
    for (auto& Block : v_Block)
    {
        // Start and end have a set format, value order is not set
        f_File << "\"" << Block.s_Name << "\" = {" << std::endl;
        
        for (auto& Value : Block.v_Value)
        {
            f_File << "\t\"" << Value.first << "\" = \"" << Value.second << "\"" << std::endl;
        }
        
        f_File << "}" << std::endl << std::endl;
    }
    
    f_File.close();
}

//*************************************************************************************
// Getters
//*************************************************************************************

std::string const& FSC_ValueFile::Block::GetValue(std::string const& s_Identifier)
{
    for (auto& Value : v_Value)
    {
        if (Value.first.compare(s_Identifier) == 0)
        {
            return Value.second;
        }
    }
    
    throw FSC_Exception("GetValue(): Identifier not found!", "FSC_ValueFile", __LINE__);
}

std::string const& FSC_ValueFile::GetValue(std::string const& s_Block, std::string const& s_Identifier)
{
    for (auto& Block : v_Block)
    {
        if (Block.s_Name.compare(s_Block) == 0)
        {
            try
            {
                return Block.GetValue(s_Identifier);
            }
            catch (FSC_Exception& e)
            {
                throw;
            }
        }
    }
    
    throw FSC_Exception("GetValue(): Block not found!", "FSC_ValueFile", __LINE__);
}
