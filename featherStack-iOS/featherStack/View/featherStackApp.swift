//
//  featherStackApp.swift
//
//  This file is part of the featherStack app project.
//  See the AUTHORS file for Copyright information.
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

// Imports
import SwiftUI


@main
struct featherStackApp: App {
    
    //************************************************************
    // Variables
    //************************************************************
    
    private var c_Settings = FSSettingsViewModel() 
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some Scene {
        WindowGroup {
            FSHomeView().environmentObject(c_Settings)
        }
    }
}
