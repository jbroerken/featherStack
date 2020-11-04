/**
 *  FSC_Error.h
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

#ifndef FSC_Error_h
#define FSC_Error_h

// C
#include <stddef.h>

// External

// Project
#include "../FSC_Common.h"


#ifdef __cplusplus
extern "C"
{
#endif

    //*************************************************************************************
    // Types
    //*************************************************************************************

    typedef enum
    {
        // None
        FSC_ERROR_NONE = -1,
        
        // Unknown
        FSC_ERROR_UNK = 0,
        
        // General
        FSC_ERROR_GENERAL_INVALID_PARAM = 1,
        FSC_ERROR_GENERAL_MALLOC = 2,
        FSC_ERROR_GENERAL_STRING_LENGTH = 3,
        FSC_ERROR_GENERAL_NO_FILE = 4,
        
        // Card
        FSC_ERROR_CARD_NOT_LOADED = 6,
        FSC_ERROR_CARD_QUESTION_OOB = 7,
        FSC_ERROR_CARD_QUESTION_CONTENT,
        
        // Card Set
        FSC_ERROR_CARD_SET_NOT_CARDS,
        
        // Context
        FSC_ERROR_CONTEXT_NO_SET,
        
        // Bounds
        FSC_ERROR_TYPE_MAX = FSC_ERROR_CONTEXT_NO_SET,

        FSC_ERROR_TYPE_COUNT = FSC_ERROR_TYPE_MAX + 1

    }FSC_Error;

    //*************************************************************************************
    // Reset
    //*************************************************************************************

    /**
     *  Reset the last library error. This function is thread safe.
     */

    extern void FSC_EReset(void);

    //*************************************************************************************
    // Getters
    //*************************************************************************************

    /**
     *  Get the current library error. This function is thread safe.
     *
     *  \return The current library error.
     */

    extern FSC_Error FSC_EGetError(void);
    
    /**
     *  Get library error string. This function is thread safe.
     *
     *  \return The current library error string.
     */

    extern const char* FSC_NONNULL FSC_EGetErrorString(void);

#ifdef __cplusplus
}
#endif

#endif /* FSC_Error_h */
