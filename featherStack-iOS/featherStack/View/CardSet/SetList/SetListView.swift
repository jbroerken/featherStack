//
//  SetListView.swift
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


struct FSSetListView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @EnvironmentObject var c_Settings: FSSettingsViewModel
    
    @StateObject private var c_Model = FSSetListViewModel()
    
    @Binding var s_AddURL: URL
    
    @State private var s_SearchText: String = ""
    @State private var i_Navigate: Int? = nil
    
    //************************************************************
    // Add Card Set Body
    //************************************************************
    
    var v_AddSet: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("@ADD_TEXT", tableName: "SetList")
                .foregroundColor(Color("InfoTextColor"))
                .frame(width: 240)
                .multilineTextAlignment(.center)
                .padding()
            
            // Same action as title bar "+", convinience
            Button(action: {
                UIApplication.shared.windows.first?.rootViewController?.present(FSSetPickerView(self.$s_AddURL),
                                                                                animated: true)
            }) {
                HStack {
                    Image(systemName: "folder.fill.badge.plus")
                        .foregroundColor(Color("AddSetButtonIconColor"))
                        .padding()
                    Text("@ADD_BUTTON", tableName: "SetList")
                        .foregroundColor(Color("AddSetButtonTextColor"))
                        .padding([.top, .bottom, .trailing])
                }
                .background(Color("AddSetButtonColor"))
                .cornerRadius(20)
                .shadow(radius: 10, y: 10)
                
            }
            
            Spacer()
        }
    }
    
    //************************************************************
    // Card Set List Body
    //************************************************************
    
    var v_SetList: some View {
        VStack {
            List {
                // Search bar should move with the list like in other apps
                FSSearchBarView(s_Text: $s_SearchText)
                    .padding()
                
                // List card sets as buttons
                ForEach(0 ..< c_Model.GetSetCount(), id:\.self) { i_Entry in
                    if let c_Set = GetEntry(i_Entry) {
                        Button(action: {
                            // Simple press leads directly to practice
                            self.SelectEntry(i_Entry: i_Entry,
                                             s_Title: c_Set.s_Title,
                                             e_Mode: FSActiveSetView.Mode.Practice)
                        }) {
                            FSSetInfoView(c_Set)
                                .frame(minHeight: 70.0, maxHeight: 70.0) // Force same height even for multiline text
                        }
                        .contextMenu(ContextMenu(menuItems: { /* Allow options if desired */
                            Button(action: {
                                self.SelectEntry(i_Entry: i_Entry,
                                                 s_Title: c_Set.s_Title,
                                                 e_Mode: FSActiveSetView.Mode.Practice)
                            }) {
                                Image(systemName: "play.fill")
                                Text("@CMENU_PRACTICE", tableName: "SetList")
                            }
                            
                            Button(action: {
                                self.SelectEntry(i_Entry: i_Entry,
                                                 s_Title: c_Set.s_Title,
                                                 e_Mode: FSActiveSetView.Mode.Read)
                            }) {
                                Image(systemName: "book.fill")
                                Text("@CMENU_READ", tableName: "SetList")
                            }
                        }))
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { (i) in
                        self.c_Model.RemoveSet(i)
                    }
                })
            }
        }
    }
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack {
            // Add a divider to appear under the nav bar title
            Divider()
                .padding([.leading, .trailing])
            
            // Show content depending on set count
            if (c_Model.GetSetCount() > 0) {
                // We have one or more sets, list them
                v_SetList
                
                // NOTE: This empty link shows the card sets. Doing so
                //       allows us to have only one view for all card set
                //       items. It also triggers through context menues.
                if (i_Navigate != nil) {
                    if let c_Set = c_Model.GrabSet() {
                        NavigationLink(destination: FSActiveSetView(c_Set: c_Set,
                                                                    s_Title: c_Model.c_Selection.s_Title,
                                                                    e_Mode: c_Model.c_Selection.e_Mode)
                                        .onDisappear(perform: {
                                            self.ResetSelection()
                                        }),
                                       tag: 1,
                                       selection: self.$i_Navigate) {
                            EmptyView()
                        }
                    }
                }
            } else {
                // No set, show add info
                v_AddSet
            }
        }
        .onChange(of: self.s_AddURL) {_ in
            if (self.s_AddURL.path.count > 0) {
                self.c_Model.AddSet(self.s_AddURL)
            }
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    init(_ s_AddURL: Binding<URL>) {
        self._s_AddURL = s_AddURL
    }
    
    //************************************************************
    // Card Set
    //************************************************************
    
    /**
     *  Get a card set entry.
     *
     *  - Parameter i_Entry: The set entry for the card set.
     *
     *  - Returns: The requested card set
     */
    
    func GetEntry(_ i_Entry: Int) -> FSContext.FSEntry? {
        guard let c_Entry = c_Model.GetEntry(i_Entry) else {
            return nil
        }
        
        // Apply filter
        if (s_SearchText.isEmpty) {
            return c_Entry
        }
        
        if (!c_Settings.b_SExactString) {
            // Ignore capitalization requires lowercasing
            let s_Title = c_Entry.s_Title.lowercased()
            let s_Substring = s_SearchText.lowercased()
            
            if (!s_Title.contains(s_Substring)) {
                return nil
            }
        } else {
            // Standard, as-is
            if (!c_Entry.s_Title.contains(s_SearchText)) {
                return nil
            }
        }
        
        // Filter passed
        return c_Entry
    }
    
    /**
     *  Select a card set entry and trigger a navigation link.
     *
     *  - Parameter i_Entry: The set entry for the card set.
     *  - Parameter s_Title: The title of the card set.
     *  - Parameter e_Mode: The mode to view the card set in.
     */
    
    private func SelectEntry(i_Entry: Int, s_Title: String, e_Mode: FSActiveSetView.Mode) -> Void {
        c_Model.SelectEntry(i_Entry: i_Entry,
                            s_Title: s_Title,
                            e_Mode: e_Mode)
        i_Navigate = 1
    }
    
    /**
     *  Reset the current selection.
     */
    
    private func ResetSelection() -> Void {
        if (c_Settings.b_SClearTextOnNav) {
            s_SearchText = ""
        }
        
        i_Navigate = nil
    }
}
