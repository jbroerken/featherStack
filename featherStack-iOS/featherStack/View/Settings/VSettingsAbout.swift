//
//  VSettingsAbout.swift
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


struct FSSettingsAboutView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @State private var s_SourceURL: URL? = URL(string: NSLocalizedString("@ABOUT_SOURCE_WEB",
                                                                         tableName: "SSettings",
                                                                         comment: "Source code url"))
    
    //************************************************************
    // Source Code Body
    //************************************************************
    
    var v_SourceCode: some View {
        VStack {
            Image(systemName: "globe")
                .font(.title)
                .foregroundColor(Color("AboutLogoColor"))
                .padding(.bottom)
            
            Text("@ABOUT_SOURCE_INFO", tableName: "SSettings")
            
            // Tappable URL
            Button(action: {
                if let s_URL = s_SourceURL {
                    UIApplication.shared.open(s_URL)
                }
            }) {
                Text("@ABOUT_SOURCE_WEB", tableName: "SSettings")
            }
            .padding(.top)
        }
    }
    
    //************************************************************
    // Developer Body
    //************************************************************
    
    var v_Developer: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.title)
                .foregroundColor(Color("AboutLogoColor"))
                .padding(.bottom)
            
            Text("@ABOUT_COPYRIGHT_DEVELOPER", tableName: "SSettings")
            Text("@ABOUT_COPYRIGHT_SIGNATURE", tableName: "SSettings")
        }
    }
    
    //************************************************************
    // Addition Components Body
    //************************************************************
    
    var v_AdditionalComponents: some View {
        VStack {
            Image(systemName: "plus.circle")
                .font(.title)
                .foregroundColor(Color("AboutLogoColor"))
                .padding(.bottom)
            
            Text("@ABOUT_COPYRIGHT_EXTRA", tableName: "SSettings")
                .padding(.bottom)
            // Add new copyrights for 3rd party here if needed, no padding
            Text("@ABOUT_COPYRIGHT_EXRTA_ZIP", tableName: "SSettings")
                .padding(.bottom)
        }
    }
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        GeometryReader { geometry in // Scale image
            ScrollView {
                VStack(alignment: .center) {
                    // App Info
                    // NOTE: Relies on geometry reader, keep here
                    VStack {
                        Image("LaunchScreenLogo")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("AboutLogoColor"))
                            .frame(width: geometry.size.width * 0.5,
                                   height: geometry.size.width * 0.5)
                            .padding()
                        Text("@ABOUT_APP_TITLE", tableName: "SSettings")
                            .font(.title)
                        Text("@ABOUT_APP_DESC", tableName: "SSettings")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing])
                    
                    Divider()
                        .padding()
                    
                    // Source Code Info
                    v_SourceCode
                        .padding([.leading, .trailing])
                    
                    Divider()
                        .padding()
                    
                    // Developer
                    v_Developer
                        .padding([.leading, .trailing])
                    
                    Divider()
                        .padding()
                    
                    // 3rd Party
                    v_AdditionalComponents
                        .padding([.leading, .trailing])
                }
                .multilineTextAlignment(.center)
            }
        }
        .navigationBarTitle(Text("@ABOUT_TITLE", tableName: "SSettings"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
