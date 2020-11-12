//
//  VSettingsButton.swift
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


struct FSSettingsButtonView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let s_Image: String
    private let e_ImageColor: Color
    private let e_BackgroundColor: Color
    private let s_String: String
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    Image(systemName: s_Image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .foregroundColor(e_ImageColor)
                        .background(RoundedRectangle(cornerRadius: 5, style: .continuous)
                                        .foregroundColor(e_BackgroundColor)
                                        .frame(width: geometry.size.height * 0.9,
                                               height: geometry.size.height * 0.9,
                                               alignment: .center)
                        )
                    
                    Text(s_String)
                }
            }
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the settings button view.
     *
     *  - Parameter s_String: The button text.
     *  - Parameter s_Image: The button system icon.
     *  - Parameter e_ImageColor: The system icon image color.
     *  - Parameter e_BackgroundColor: The background rectangle color.
     */
    
    init(s_String: String, s_Image: String, e_ImageColor: Color, e_BackgroundColor: Color) {
        self.s_String = s_String
        self.s_Image = s_Image
        self.e_ImageColor = e_ImageColor
        self.e_BackgroundColor = e_BackgroundColor
    }
}
