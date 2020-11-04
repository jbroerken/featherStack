/**
 *  FSC_Card.h
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

#ifndef FSC_Card_h
#define FSC_Card_h

// C
#include <wchar.h>
#include <stdint.h>

// External

// Project
#include "./Error/FSC_Error.h"


#ifdef __cplusplus
extern "C"
{
#endif

    //*************************************************************************************
    // Types
    //*************************************************************************************

    typedef struct FSC_Card_t FSC_CardOpaque;

    // Cards can be of special types for different exercises
    typedef enum
    {
        FSC_CTYPE_UNK = -1,
        
        FSC_CDTYPE_TEXT = 0,
        FSC_CDTYPE_IMAGE = 1,
        FSC_CDTYPE_SOUND = 2,
        
        FSC_CDTYPE_MAX = FSC_CDTYPE_SOUND,
        
        FSC_CDTYPE_COUNT = 4
        
    }FSC_CDType;
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************

    /**
     *  Get the card type.
     *
     *  \param p_Card The card to check.
     *
     *  \return The FSC_CardType on success, FSC_CTYPE_UNK on failure.
     */

    extern int FSC_CDGetType(const FSC_CardOpaque* FSC_NONNULL p_Card);
    
    /**
     *  Get the card type data.
     *
     *  \param p_Card The card to check.
     *
     *  \return The card type data on success, NULL on failure.
     */
    
    extern const char* FSC_NONNULL FSC_CDGetData(const FSC_CardOpaque* FSC_NONNULL p_Card);
    
    /**
     *  Get the card header.
     *
     *  \param p_Card The card to check.
     *
     *  \return The card header on success, NULL on failure.
     */
    
    extern const char* FSC_NONNULL FSC_CDGetQuestion(const FSC_CardOpaque* FSC_NONNULL p_Card);
    
    /**
     *  Get a card answer.
     *
     *  \param p_Card The card to check.
     *
     *  \return The card answer on success, NULL on failure.
     */
    
    extern const char* FSC_NONNULL FSC_CDGetAnswer(const FSC_CardOpaque* FSC_NONNULL p_Card);
    
#ifdef __cplusplus
}
#endif

#endif /* FSC_Card_h */
