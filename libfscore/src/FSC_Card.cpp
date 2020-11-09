/**
 *  FSC_Card.cpp
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
#include "../include/FSC_Card.h"
#include "./FSC_CardData.h"
#include "./Error/FSC_ErrorInternal.h"


//*************************************************************************************
// Constructor / Destructor
//*************************************************************************************

FSC_Card_t::FSC_Card_t() noexcept : s_FilePath(""),
                                    s_Data(""),
                                    s_Question(""),
                                    s_Answer("")
{
    i_CardType = 0;
}

FSC_Card_t::~FSC_Card_t() noexcept
{}

//*************************************************************************************
// Card State
//*************************************************************************************

bool FSC_CDUsable(const FSC_Card* p_Card)
{
    if (p_Card == NULL)
    {
        FSC_ESetError(FSC_ERROR_GENERAL_INVALID_PARAM);
        return false;
    }
    
    return true;
}

//*************************************************************************************
// Getters
//*************************************************************************************

int FSC_CDGetType(const FSC_CardOpaque* p_Card)
{
    return FSC_CDUsable(p_Card) ? p_Card->i_CardType : FSC_CTYPE_UNK;
}

const char* FSC_CDGetData(const FSC_CardOpaque* p_Card)
{
    return FSC_CDUsable(p_Card) ? p_Card->s_Data.c_str() : NULL;
}

const char* FSC_CDGetQuestion(const FSC_CardOpaque* p_Card)
{
    return FSC_CDUsable(p_Card) ? p_Card->s_Question.c_str() : NULL;
}

const char* FSC_CDGetAnswer(const FSC_CardOpaque* p_Card)
{
    return FSC_CDUsable(p_Card) ? p_Card->s_Answer.c_str() : NULL;
}
