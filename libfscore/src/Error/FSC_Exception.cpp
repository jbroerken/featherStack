/**
 *  FSC_Exception.cpp
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

// External

// Project
#include "./FSC_Exception.h"


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_Exception::FSC_Exception(std::string const& s_Message,
                             const char* p_File,
                             size_t us_Line) : s_Message(s_Message),
                                               s_File(p_File)
{
    this->us_Line = us_Line;
}

FSC_Exception::FSC_Exception(const char* p_Message,
                             const char* p_File,
                             size_t us_Line) : s_Message(p_Message),
                                               s_File(p_File)
{
    this->us_Line = us_Line;
}

FSC_Exception::~FSC_Exception()
{}

//*************************************************************************************
// Getters
//*************************************************************************************

const char* FSC_Exception::what() const throw()
{
    return s_Message.c_str();
}

std::string FSC_Exception::what2() const throw()
{
    return s_Message;
}

std::string FSC_Exception::file() const throw()
{
    return s_File;
}

size_t FSC_Exception::line() const throw()
{
    return us_Line;
}
