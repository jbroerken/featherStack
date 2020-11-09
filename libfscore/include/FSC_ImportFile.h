/**
 *  FSC_ImportFile.h
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

#ifndef FSC_ImportFile_h
#define FSC_ImportFile_h

// C
#include <stddef.h>

// External

// Project
#include "./FSC_Common.h"


#ifdef __cplusplus
extern "C"
{
#endif

    //*************************************************************************************
    // Types
    //*************************************************************************************

    typedef struct FSC_ImportFile_t FSC_ImportFileOpaque;
    
    //*************************************************************************************
    // Create
    //*************************************************************************************
    
    /**
     *  Create a import file by reading from disk.
     *
     *  \param p_FilePath The path to the import file.
     *
     *  \return The import file on success, NULL on failure.
     */
    
    extern FSC_ImportFileOpaque* FSC_NULLABLE FSC_IFCreate(const char* FSC_NONNULL p_FilePath);
    
    //*************************************************************************************
    // Destroy
    //*************************************************************************************
    
    /**
     *  Destroy a import file.
     *
     *  \param p_File The file to destroy.
     *
     *  \return NULL on success, the given file on failure.
     */
    
    extern FSC_ImportFileOpaque* FSC_NULLABLE FSC_IFDestroy(FSC_ImportFileOpaque* FSC_NONNULL p_File);
    
    //*************************************************************************************
    // Getters
    //*************************************************************************************

    /**
     *  Get the import card set file name.
     *
     *  \param p_File The import file to check.
     *
     *  \return The file name on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_IFGetSetFile(const FSC_ImportFileOpaque* FSC_NONNULL p_File);
    
    /**
     *  Get the import card set directory name.
     *
     *  \param p_File The import file to check.
     *
     *  \return The directory name on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_IFGetDirName(const FSC_ImportFileOpaque* FSC_NONNULL p_File);
    
    /**
     *  Get the import set file count.
     *
     *  \param p_File The import file to check.
     *
     *  \return The set file count on success, 0 (default) on failure.
     */
    
    extern size_t FSC_IFGetFileCount(const FSC_ImportFileOpaque* FSC_NONNULL p_File);
    
    /**
     *  Get the import set file path.
     *
     *  \param p_File The import file to check.
     *  \param us_File The index of the requested file.
     *
     *  \return The file path on success, NULL on failure.
     */
    
    extern const char* FSC_NULLABLE FSC_IFGetFilePath(const FSC_ImportFileOpaque* FSC_NONNULL p_File, size_t us_File);
    
#ifdef __cplusplus
}
#endif

#endif /* FSC_ImportFile_h */
