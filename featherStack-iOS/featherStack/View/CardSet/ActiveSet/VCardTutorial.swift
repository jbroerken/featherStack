//
//  VCardTutorial.swift
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


struct FSCardTutorialView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @EnvironmentObject var c_Settings: FSSettingsViewModel
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack(alignment: .center) {
            // Title
            Text("@TUTORIAL_TITLE", tableName: "SActiveSet")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Divider()
                .padding([.leading, .trailing, .bottom])
            
            // Section 1 (Card Flip)
            Text("@TUTORIAL_SECTION_FLIP", tableName: "SActiveSet")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            Image("CardTutorialFlip")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: Color.black.opacity(0.2), radius: 4)
            
            Text("@TUTORIAL_FLIP", tableName: "SActiveSet")
                .multilineTextAlignment(.center)
                .padding()
            
            // Section 2 (Next Card)
            Text("@TUTORIAL_SECTION_NEXT", tableName: "SActiveSet")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            // Content has to change depending on setting
            if (c_Settings.b_CDSwipeRightCorrect) {
                Image("CardTutorialSwipeRight")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                
                Text("@TUTORIAL_NEXT_R", tableName: "SActiveSet")
                    .multilineTextAlignment(.center)
                    .padding()
                
            } else {
                Image("CardTutorialSwipeLeft")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                
                Text("@TUTORIAL_NEXT_L", tableName: "SActiveSet")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("CardGradientColorTop"),
                                                               Color("CardGradientColorBottom")]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
    }
}
