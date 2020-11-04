/**
 *  FSC_Error.cpp
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
#include <atomic>

// External

// Project
#include "./FSC_ErrorInternal.h"


//*************************************************************************************
// Error Data
//*************************************************************************************

// Last error
static std::atomic<FSC_Error> e_LastError(FSC_ERROR_NONE);

//*************************************************************************************
// Reset
//*************************************************************************************

void FSC_EReset(void)
{
    e_LastError = FSC_ERROR_NONE;
}

//*************************************************************************************
// Getters
//*************************************************************************************

FSC_Error FSC_EGetError(void)
{
    return e_LastError;
}

const char* FSC_EGetErrorString(void)
{
    switch (e_LastError)
    {
        // None
        case FSC_ERROR_NONE:
            return "No error";
            
        // Unknown
        case FSC_ERROR_UNK:
            return "Unknown error";
            
        // General
        case FSC_ERROR_GENERAL_INVALID_PARAM:
            return "Invalid parameters";
        case FSC_ERROR_GENERAL_MALLOC:
            return "Memory allocation failed";
        case FSC_ERROR_GENERAL_STRING_LENGTH:
            return "Invalid string length";
        case FSC_ERROR_GENERAL_NO_FILE:
            return "No file";
        
        // Card
        case FSC_ERROR_CARD_NOT_LOADED:
            return "Card not loaded";
        case FSC_ERROR_CARD_QUESTION_OOB:
            return "Question index out of bounds";
        case FSC_ERROR_CARD_QUESTION_CONTENT:
            return "No content of type";
            
        // Card Set
        case FSC_ERROR_CARD_SET_NOT_CARDS:
            return "No cards in file list";
            
        // Context
        case FSC_ERROR_CONTEXT_NO_SET:
            return "No card set in context";
            
        default:
            return NULL;
    }
}

//*************************************************************************************
// Setters
//*************************************************************************************

void FSC_ESetError(FSC_Error e_Error)
{
    e_LastError = e_Error;
}
