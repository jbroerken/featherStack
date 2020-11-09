/**
 *  FSC_Common.h
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

#ifndef FSC_Common_h
#define FSC_Common_h

// C

// External

// Project


//*************************************************************************************
// Version
//*************************************************************************************

#define FSC_LIB_VERSION_STRING          "1.1.0"

#define FSC_LIB_VERSION_MAJOR           1
#define FSC_LIB_VERSION_MINOR           1
#define FSC_LIB_VERSION_PATCH           0

//*************************************************************************************
// Pointer
//*************************************************************************************

#ifdef __clang__
    #define FSC_NULLABLE _Nullable
    #define FSC_NONNULL _Nonnull
#else
    #define FSC_NULLABLE
    #define FSC_NONNULL
#endif


#endif /* FSC_Common_h */
