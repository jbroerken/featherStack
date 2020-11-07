//
//  VLicenseApp.swift
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


struct FSLicenseAppView: View {
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .center) {
                    Text("@FEATHERSTACK_HEADER", tableName: "SLicense")
                        .font(.title)
                        .padding()
                    Text("@FEATHERSTACK_VERSION", tableName: "SLicense")
                        .font(.title2)
                }
                .multilineTextAlignment(.center)
            }
            .padding()
            
            Text("@FEATHERSTACK_BODY", tableName: "SLicense")
                .padding(6)
        }
        .navigationBarTitle(Text("@LICENSE_TITLE", tableName: "SSettings"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
