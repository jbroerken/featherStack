/**
 *  FSC_Exception.h
 *
 *  This file is part of the MRH project.
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

#ifndef FSC_Exception_h
#define FSC_Exception_h

// C / C++
#include <exception>
#include <string>

// External

// Project


class FSC_Exception : public std::exception
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  std::string constructor.
     *
     *  \param s_Message The error message.
     *  \param p_File The name of the file where the exception occured.
     *  \param us_Line The line in the file where the exception occured.
     */
    
    FSC_Exception(std::string const& s_Message,
                  const char* p_File,
                  size_t us_Line);
    
    /**
     *  const char* constructor.
     *
     *  \param p_Message The error message.
     *  \param p_File The name of the file where the exception occured.
     *  \param us_Line The line in the file where the exception occured.
     */
    
    FSC_Exception(const char* p_Message,
                  const char* p_File,
                  size_t us_Line);
    
    /**
     *  Default destructor.
     */
    
    ~FSC_Exception();
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************
    
    /**
     *  Get the const char* string.
     *
     *  \return A const char* string with the error message.
     */
    
    const char* what() const throw();
    
    /**
     *  Get the std::string string.
     *
     *  \return std::string string with the error message.
     */
    
    std::string what2() const throw();
    
    /**
     *  Get the file where the exception occured.
     *
     *  \return The exception file.
     */
    
    std::string file() const throw();
    
    /**
     *  Get the file line where the exception occured.
     *
     *  \return The exception file line.
     */
    
    size_t line() const throw();
    
private:
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_Message;
    std::string s_File;
    size_t us_Line;
    
protected:
    
};

#endif /* FSC_Exception_h */
