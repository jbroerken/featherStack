//
//  AddSetView.swift
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


struct FSSearchBarView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @Binding var s_Text: String
    
    @State private var b_Editing = false
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        HStack {
            TextField(NSLocalizedString("@SEARCH", tableName: "SetList", comment: "Temp search text"), text: $s_Text, onCommit:  {
                UIApplication.shared.HideKeyboard()
            })
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            )
            .padding(.horizontal, 10)
            .onTapGesture {
                self.b_Editing = true
            }
            
            // Add a cancel button
            if (!s_Text.isEmpty) {
                Image(systemName: "multiply.circle.fill")
                    .imageScale(.large)
                    .padding(.trailing, 10)
                    .onTapGesture(perform: {
                        UIApplication.shared.HideKeyboard()
                        self.s_Text = ""
                        self.b_Editing = false
                    })
            }
        }
    }
}

//************************************************************
// Extensions
//************************************************************

extension UIApplication {
    
    /**
     *  Signal a keyboard hide request.
     */
    
    func HideKeyboard() -> Void {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
