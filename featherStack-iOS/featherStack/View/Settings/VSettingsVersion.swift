//
//  VSettingsVersion.swift
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


struct FSSettingsVersionView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @State var s_AppVersion: String? = UIApplication.appVersion
    @State var s_AppBuild: String? = UIApplication.appBuild
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack {
            Image("LaunchScreenLogo")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .opacity(0.4)
            
            VStack {
                Text("featherStack")
                    .font(.title)
                Text("Version \(s_AppVersion ?? "<Unknown>") (\(s_AppBuild ?? "<Unknown>"))")
            }
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.gray)
        .padding(.top)
    }
}

//************************************************************
// Extensions
//************************************************************

extension UIApplication {
    
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
