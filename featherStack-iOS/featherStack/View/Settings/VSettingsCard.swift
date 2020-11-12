//
//  VSettingsCard.swift
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
import Foundation
import SwiftUI


struct FSSettingsCardView: View {
    
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
                // Swipe direction
                Section(header: Text("@CARD_SWIPE_SECTION", tableName: "SSettings")
                            .padding(.top),
                        footer: Text("@CARD_SWIPE_INFO", tableName: "SSettings")) {
                    // Right
                    Button(action: {
                        self.c_Settings.b_CDSwipeRightCorrect = true
                    }) {
                        HStack {
                            Text("@CARD_SWIPE_RIGHT", tableName: "SSettings")
                                .foregroundColor(Color(.label))
                            
                            if (c_Settings.b_CDSwipeRightCorrect) {
                                Spacer()
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("AccentColor"))
                            }
                        }
                    }
                    
                    // Left
                    Button(action: {
                        self.c_Settings.b_CDSwipeRightCorrect = false
                    }) {
                        HStack {
                            Text("@CARD_SWIPE_LEFT", tableName: "SSettings")
                                .foregroundColor(Color(.label))
                            
                            if (!c_Settings.b_CDSwipeRightCorrect) {
                                Spacer()
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("AccentColor"))
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("@CARD_TITLE", tableName: "SSettings"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
