//
//  VSetCardsInfo.swift
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


struct FSSetCardsInfoView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let s_Image: String
    private let s_Text: String
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Image(s_Image)
                .opacity(0.8)
                .padding()
            
            Text(s_Text)
                .foregroundColor(Color("CardBackgroundTextColor"))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the set cards info view.
     *
     *  - Parameter s_Image: The image asset to display.
     *  - Parameter s_Text: The text to display below the image.
     */
    
    init(s_Image: String, s_Text: String) {
        self.s_Image = s_Image
        self.s_Text = s_Text
    }
}
