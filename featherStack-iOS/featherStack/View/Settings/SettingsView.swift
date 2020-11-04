//
//  SettingsView.swift
//
//  Copyright (C) 2020 Jens Broerken
//  <jens.broerken@hs-augsburg.de>
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
import Foundation
import SwiftUI


struct FSSettingsView: View {
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        ZStack {
            List {
                // Card & Card Set Settings
                Section {
                    NavigationLink(destination: FSSettingsCardView()) {
                        FSSettingsButtonView(s_String: NSLocalizedString("@SETTINGS_CARD",
                                                                         tableName: "Settings",
                                                                         comment: "Card button"),
                                             s_Image: "tray.fill",
                                             e_ImageColor: .white,
                                             e_BackgroundColor: .orange)
                    }
                }
                
                // Search
                Section {
                    NavigationLink(destination: FSSettingsSearchView()) {
                        FSSettingsButtonView(s_String: NSLocalizedString("@SETTINGS_SEARCH",
                                                                         tableName: "Settings",
                                                                         comment: "Search button"),
                                             s_Image: "magnifyingglass",
                                             e_ImageColor: .white,
                                             e_BackgroundColor: .gray)
                    }
                }
                
                // Acknoledgements
                Section(footer: FSSettingsVersionView()) {
                    NavigationLink(destination: FSSettingsAboutView()) {
                        FSSettingsButtonView(s_String: "About",
                                             s_Image: "questionmark.circle.fill",
                                             e_ImageColor: .white,
                                             e_BackgroundColor: .blue)
                    }
                    NavigationLink(destination: FSSettingsLicenseView()) {
                        FSSettingsButtonView(s_String: NSLocalizedString("@SETTINGS_LICENSE",
                                                                         tableName: "Settings",
                                                                         comment: "License button"),
                                             s_Image: "lock.doc.fill",
                                             e_ImageColor: .white,
                                             e_BackgroundColor: .purple)
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}
