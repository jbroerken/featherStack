/**
 *  FSC_CardSet.h
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

#ifndef FSC_CardSet_h
#define FSC_CardSet_h

// C

// External

// Project
#include "./FSC_Card.h"


#ifdef __cplusplus
extern "C"
{
#endif

    //*************************************************************************************
    // Types
    //*************************************************************************************

    typedef struct FSC_CardSet_t FSC_CardSetOpaque;
    
    typedef FSC_CardOpaque* FSC_NULLABLE * FSC_Destination;
    typedef void (*FSC_Callback)(FSC_CardOpaque* FSC_NULLABLE p_Source, FSC_CardOpaque* FSC_NULLABLE * FSC_NULLABLE p_Destination);
    
    //*************************************************************************************
    // Grab
    //*************************************************************************************
    
    /**
     *  Grab a random card from the set.
     *
     *  \param p_Set The set to grab from.
     *  \param p_Callback The callback to execute on card load.
     *  \param p_Destination The load result destination.
     */
    
    extern void FSC_CSGrabCard(FSC_CardSetOpaque* FSC_NONNULL p_Set, FSC_Callback FSC_NULLABLE p_Callback, FSC_Destination FSC_NULLABLE p_Destination);
    
    //*************************************************************************************
    // Return
    //*************************************************************************************
    
    /**
     *  Return a card to the card set.
     *
     *  \param p_Set The set to return to.
     *  \param p_Card The card to return.
     *  \param i_Completed 0 if the card should not appear again, -1 in case it should.
     *
     *  \return NULL on success, the given card on failure.
     */
    
    extern FSC_CardOpaque* FSC_NULLABLE FSC_CSReturnCard(FSC_CardSetOpaque* FSC_NONNULL p_Set, FSC_CardOpaque* FSC_NONNULL p_Card, int i_Completed);
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************

    /**
     *  Get the card set title.
     *
     *  \param p_Set The set to check.
     *
     *  \return The title string on success, NULL failure.
     */
    
    extern const char* FSC_NULLABLE FSC_CSGetTitle(const FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
    /**
     *  Get the total card set card count.
     *
     *  \param p_Set The set to check.
     *
     *  \return The total card set card count on succes, 0 (default) on failure.
     */
    
    extern size_t FSC_CSGetTotalCount(const FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
    /**
     *  Get the remaining card set card count.
     *
     *  \param p_Set The set to check.
     *
     *  \return The remaining card set card count on success, 0 (default) on failure.
     */
    
    extern size_t FSC_CSGetRemainingCount(const FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
    /**
     *  Check if the card set was finished or not.
     *
     *  \param p_Set The set to check.
     *
     *  \return 0 if the set was finished, -1 if not.
     */
    
    extern int FSC_CSGetFinished(const FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
    /**
     *  Get the path to the card set directory.
     *
     *  \param p_Set The set to check.
     *
     *  \return The card set directoryon success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_CSGetDirPath(const FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
#ifdef __cplusplus
}
#endif

#endif /* FSC_CardSet_h */
