//
//  VSetInfo.swift
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


struct FSSetInfoView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let s_Title: String
    private let s_Subtitle: String
    private let s_IconPath: String
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        HStack {
            if (FSCommon.FileExists(s_IconPath)) {
                Image(uiImage: UIImage(contentsOfFile: s_IconPath)!)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .font(.subheadline)
                    .clipShape(Circle())
                    .padding(.trailing, 6)
                    .shadow(radius: 2, y: 4)
            } else {
                Image("CardSetInfo")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .font(.subheadline)
                    .clipShape(Circle())
                    .padding(.trailing, 6)
                    .shadow(radius: 2, y: 4)
            }
            
            VStack(alignment: .leading) {
                Text(s_Title)
                    .font(.title)
                Text(s_Subtitle)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the card set info view.
     *
     *  - Parameter c_Entry: The context set entry to show information about.
     */
    
    init(_ c_Entry: FSContext.FSEntry) {
        s_Title = c_Entry.s_Title
        s_Subtitle = c_Entry.s_Subtitle
        s_IconPath = c_Entry.s_IconPath
    }
}
