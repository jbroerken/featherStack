/**
 *  FSC_ErrorInternal.h
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

#ifndef FSC_ErrorInternal_h
#define FSC_ErrorInternal_h

// C++ / C

// External

// Project
#include "../../include/Error/FSC_Error.h"


//*************************************************************************************
// Setters
//*************************************************************************************

/**
 *  Set the current library error. This function is thread safe.
 *
 *  \param e_Error The current library error.
 */

extern void FSC_ESetError(FSC_Error e_Error);

#endif /* FSC_ErrorInternal_h */
