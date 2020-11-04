/**
 *  FSC_CardData.h
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

#ifndef FSC_CardData_h
#define FSC_CardData_h

// C++ / C
#include <vector>
#include <string>
#include <utility>
#include <stdint.h>

// External

// Project

// Pre-defined
#define FSC_CD_STR_MAX_LENGTH                       511
#define FSC_CD_STR_BUFFER_LENGTH                    512


//*************************************************************************************
// Types
//*************************************************************************************

typedef struct FSC_Card_t
{
public:
    
    //*************************************************************************************
    // Constructor / Destructor
    //*************************************************************************************
    
    /**
     *  Card constructor.
     */
    
    FSC_Card_t() noexcept;
    
    /**
     *  Card destructor.
     */
    
    ~FSC_Card_t() noexcept;
    
    //*************************************************************************************
    // Data
    //*************************************************************************************
    
    std::string s_FilePath;
    
    int i_CardType;
    std::string s_Data;
    
    std::string s_Question;
    std::string s_Answer;
    
private:
    
protected:
    
}FSC_Card;

//*************************************************************************************
// Card State
//*************************************************************************************

/**
 *  Check if a card is in a usable state.
 *
 *  \param p_Card The card to check.
 *
 *  \return true if usable, false if not.
 */

extern bool FSC_CDUsable(const FSC_Card* p_Card);

#endif /* FSC_CardData_h */
