//
//  SettingsSearchView.swift
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


struct FSSettingsSearchView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @EnvironmentObject var c_Settings: FSSettingsViewModel
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        ZStack {
            List {
                // Clear Text
                Section(header: Text("@SEARCH_CLEAR_SECTION", tableName: "Settings")
                            .padding(.top),
                        footer: Text("@SEARCH_CLEAR_INFO", tableName: "Settings")) {
                    Toggle(isOn: self.$c_Settings.b_SClearTextOnNav) {
                        Text("@SEARCH_CLEAR_CHOICE", tableName: "Settings")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                }
                
                // Input Capitalization
                Section(header: Text("@SEARCH_CAPITALIZATION_SECTION", tableName: "Settings")
                            .padding(.top),
                        footer: Text("@SEARCH_CAPITALIZATION_INFO", tableName: "Settings")) {
                    Toggle(isOn: self.$c_Settings.b_SExactString) {
                        Text("@SEARCH_CAPITALIZATION_CHOICE", tableName: "Settings")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("@SEARCH_TITLE", tableName: "Settings"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
