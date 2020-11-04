/**
 *  FSC_Context.h
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

#ifndef FSC_Context_h
#define FSC_Context_h

// C

// External

// Project
#include "./FSC_CardSet.h"


#ifdef __cplusplus
extern "C"
{
#endif

    //*************************************************************************************
    // Types
    //*************************************************************************************

    typedef struct FSC_Context_t FSC_ContextOpaque;
    
    //*************************************************************************************
    // Create
    //*************************************************************************************
    
    /**
     *  Create a new context.
     *
     *  \param p_DirPath The path to the card data directory.
     *  \param p_FileName The file name of the card set list.
     *  \param us_CacheLimit The limit of the card cache.
     *
     *  \return A context on success, NULL on failure.
     */
    
    extern FSC_ContextOpaque* FSC_NULLABLE FSC_COCreate(const char* FSC_NONNULL p_DirPath, const char* FSC_NONNULL p_FileName, size_t us_CacheLimit);
    
    //*************************************************************************************
    // Destroy
    //*************************************************************************************
    
    /**
     *  Destroy a given context.
     *
     *  \param p_Context The context to destroy.
     *
     *  \return NULL on success, the given context on failure.
     */
    
    extern FSC_ContextOpaque* FSC_NULLABLE FSC_CODestroy(FSC_ContextOpaque* FSC_NONNULL p_Context);
    
    //*************************************************************************************
    // Current Set
    //*************************************************************************************
    
    /**
     *  Create a card set for the given context.
     *
     *  \param p_Context The context to use.
     *  \param us_Set The index of the card set to use.
     *
     *  \return A card set on success, NULL on failure.
     */
    
    extern FSC_CardSetOpaque* FSC_NULLABLE FSC_COCreateSet(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    /**
     *  Destroy a card set for the given context.
     *
     *  \param p_Context The context to use.
     *  \param p_Set The card set to destroy.
     *
     *  \return NULL on success, the given card set on failure.
     */
    
    extern FSC_CardSetOpaque* FSC_NULLABLE FSC_CODestroySet(FSC_ContextOpaque* FSC_NONNULL p_Context, FSC_CardSetOpaque* FSC_NONNULL p_Set);
    
    //*************************************************************************************
    // Set List
    //*************************************************************************************
    
    /**
     *  Add a card set for the given context. Please note that the files have to be
     *  added by the application itself.
     *
     *  \param p_Context The context to use.
     *  \param p_SetFile The path to the set file to add.
     *
     *  \return 0 on success, -1 on failure.
     */
    
    extern int FSC_COAddSet(FSC_ContextOpaque* FSC_NONNULL p_Context, const char* FSC_NONNULL p_SetFile);
    
    /**
     *  Remove a card set for the given context. Please note that the files have to be
     *  removed by the application itself.
     *
     *  \param p_Context The context to use.
     *  \param us_Set The set to remove.
     *
     *  \return 0 on success, -1 on failure.
     */
    
    extern int FSC_CORemoveSet(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************
    
    /**
     *  Get the total card set count.
     *
     *  \param p_Context The context to check.
     *
     *  \return The total card set count.
     */
    
    extern size_t FSC_COGetSetCount(FSC_ContextOpaque* FSC_NONNULL p_Context);
    
    /**
     *  Get a card set title.
     *
     *  \param p_Context The context to check.
     *  \param us_Set The set to get the title from.
     *
     *  \return The card set title on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_COGetSetTitle(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    /**
     *  Get a card set subtitle.
     *
     *  \param p_Context The context to check.
     *  \param us_Set The set to get the subtitle from.
     *
     *  \return The card set subtitle on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_COGetSetSubtitle(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    /**
     *  Get a card set directory path.
     *
     *  \param p_Context The context to check.
     *  \param us_Set The set to get the directory path from.
     *
     *  \return The card set directory path on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_COGetSetDirPath(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    /**
     *  Get a card set file path.
     *
     *  \param p_Context The context to check.
     *  \param us_Set The set to get the file path from.
     *
     *  \return The card set file path on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_COGetSetFilePath(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
    /**
     *  Get a card set icon path.
     *
     *  \param p_Context The context to check.
     *  \param us_Set The set to get the icon path from.
     *
     *  \return The card set icon path on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_COGetSetIconPath(FSC_ContextOpaque* FSC_NONNULL p_Context, size_t us_Set);
    
#ifdef __cplusplus
}
#endif

#endif /* FSC_Context_h */
