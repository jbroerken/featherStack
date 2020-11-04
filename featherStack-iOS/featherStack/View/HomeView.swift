//
//  HomeView.swift
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


struct FSHomeView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @State private var i_Tab = 0;
    @State private var s_AddURL = URL(fileURLWithPath: "") // Set and SetListView Button
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        NavigationView {
            TabView(selection: $i_Tab) {
                
                // Card Set
                FSSetListView(self.$s_AddURL)
                    .tabItem {
                        Image(systemName: "tray.fill")
                        Text("@TAB_CARDSETS", tableName: "Home")
                    }
                    .tag(0)

                // Settings Tab
                FSSettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("@TAB_SETTINGS", tableName: "Home")
                    }
                    .tag(1)
            }
            .navigationBarTitle(Text(navigationBarTitle))
            .navigationBarItems(trailing: navigationBarTrailingItems)
            .navigationBarTitleDisplayMode(navigationBarTitleDisplayMode)
        }
    }
}

//************************************************************
// Extensions
//************************************************************

// NOTE: We need this extension since we want to show different navigation bars
//       on each toolbar, yet also remove the toolbar when selecting a card set.
//
//       Thats why we order NavigationView on top which causes the toolbar to
//       disappear when following a NavigationLink.
//       The navigation bar modification is now handled globally, based on the
//       selected tab.

private extension FSHomeView {
    
    var navigationBarTitle: String {
        switch (i_Tab) {
            case 1: return NSLocalizedString("@TITLE_SETTINGS", tableName: "Home", comment: "Settings title")
                
            // Use card set as default
            default: return NSLocalizedString("@TITLE_CARDSETS", tableName: "Home", comment: "Card set title")
        }
    }
    
    var navigationBarTitleDisplayMode: NavigationBarItem.TitleDisplayMode {
        switch (i_Tab) {
            case 0: return .large
                
            // Use settings as default
            default: return .inline
        }
        
    }

    @ViewBuilder
    var navigationBarTrailingItems: some View {
        // Only the card set tab adds items
        if (i_Tab == 0) {
            HStack {
                // Add Card Set
                Button(action: {
                    UIApplication.shared.windows.first?.rootViewController?.present(FSSetPickerView(self.$s_AddURL),
                                                                                    animated: true)
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
                .padding([.top, .trailing])
            }
        }
    }
}
