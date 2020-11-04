/**
 *  FSC_ValueFile.h
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

#ifndef FSC_ValueFile_h
#define FSC_ValueFile_h

// C++ / C
#include <vector>

// External

// Project
#include "../Error/FSC_Exception.h"


class FSC_ValueFile
{
public:
    
    //*************************************************************************************
    // Types
    //*************************************************************************************
    
    typedef std::pair<std::string, std::string> Value;
    
    class Block
    {
    public:
        
        //*************************************************************************************
        // Constructor / Destructor
        //*************************************************************************************
        
        /**
         *  Value file constructor.
         *
         *  \param s_Name The name of this block.
         */
        
        Block(std::string const& s_Name) noexcept;
        
        /**
         *  Value file destructor.
         */
        
        ~Block() noexcept;
        
        //*************************************************************************************
        // Getters
        //*************************************************************************************
        
        /**
         *  Get a value for an identifier.
         *
         *  \param s_Identifier The value name identifier.
         *
         *  \return The requested value.
         */
        
        std::string const& GetValue(std::string const& s_Identifier);
        
        //*************************************************************************************
        // Data
        //*************************************************************************************
        
        std::string s_Name;
        std::vector<Value> v_Value;
        
    private:
        
    protected:
        
    };
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Value file constructor.
     *
     *  \param s_FilePath The path to the value file.
     */
    
    FSC_ValueFile(std::string const& s_FilePath);
    
    /**
     *  Value file destructor.
     */
    
    ~FSC_ValueFile() noexcept;
    
    //*************************************************************************************
    // Read
    //*************************************************************************************
    
    /**
     *  Read a given value file.
     *
     *  \param s_FilePath The path to the value file.
     */
    
    void Read(std::string const& s_FilePath);
    
    //*************************************************************************************
    // Write
    //*************************************************************************************
    
    /**
     *  Write a given value file.
     *
     *  \param s_FilePath The path to the value file.
     */
    
    void Write(std::string const& s_FilePath);
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************
    
    /**
     *  Get a value from a block.
     *
     *  \param s_Block The block name identifier.
     *  \param s_Identifier The block value name identifier.
     *
     *  \return The requested value from the requested block.
     */
    
    std::string const& GetValue(std::string const& s_Block, std::string const& s_Identifier);
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::vector<Block> v_Block;
    
private:
    
    //*************************************************************************************
    // Read
    //*************************************************************************************
    
    /**
     *  Check if the given line is the start of a block. This function will create a new block if
     *  a block start was found.
     *
     *  \param s_Line The line to check.
     *
     *  \return true if the line is a block start, false if not.
     */
    
    inline bool IsBlockStart(std::string const& s_Line) noexcept;
    
    /**
     *  Check if the given line is the end of a block.
     *
     *  \param s_Line The line to check.
     *
     *  \return true if the line is a block end, false if not.
     */
    
    inline bool IsBlockEnd(std::string const& s_Line) noexcept;
    
    /**
     *  Read a block value.
     *
     *  \param s_Line The line to check.
     */
    
    inline void ReadValue(std::string const& s_Line) noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
protected:
    
};

#endif /* FSC_ValueFile_h */
