//
//  VMSettings.swift
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


final class FSSettingsViewModel: ObservableObject {
    
    //************************************************************
    // Variables
    //************************************************************
    
    // Tutorial
    @Published var b_TShowCard: Bool {
        didSet {
            Write(e_Setting: FSSettingsFile.FSSetting.TCard,
                  a_Value: b_TShowCard)
        }
    }
    
    // Card settings
    @Published var b_CDSwipeRightCorrect: Bool {
        didSet {
            Write(e_Setting: FSSettingsFile.FSSetting.CDSwipeRight,
                  a_Value: b_CDSwipeRightCorrect)
        }
    }
    
    // Search settings
    @Published var b_SClearTextOnNav: Bool {
        didSet {
            Write(e_Setting: FSSettingsFile.FSSetting.SClearTextOnNav,
                  a_Value: b_SClearTextOnNav)
        }
    }
    @Published var b_SExactString: Bool {
        didSet {
            Write(e_Setting: FSSettingsFile.FSSetting.SExactString,
                  a_Value: b_SExactString)
        }
    }
    
    // File
    private var c_File: FSSettingsFile = FSSettingsFile()
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the settings view model.
     */
    
    init() {
        do {
            try c_File.Read()
        } catch let e as FSSettingsFile.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
        
        // Copy the either read or default values
        b_TShowCard = (c_File.GetValue(e_Setting: .TCard) as? Bool)!
        b_CDSwipeRightCorrect = (c_File.GetValue(e_Setting: .CDSwipeRight) as? Bool)!
        b_SClearTextOnNav = (c_File.GetValue(e_Setting: .SClearTextOnNav) as? Bool)!
        b_SExactString = (c_File.GetValue(e_Setting: .SExactString) as? Bool)!
    }
    
    //************************************************************
    // Write
    //************************************************************
    
    /**
     *  Write the current settings to file.
     *
     *  - Parameter e_Setting: The settings value.
     *  - Parameter a_Value: The value to set.
     */
    
    private func Write(e_Setting: FSSettingsFile.FSSetting, a_Value: Any) -> Void {
        c_File.SetValue(e_Setting: e_Setting,
                        a_Value: a_Value)
        
        do {
            try c_File.Write()
        } catch let e as FSSettingsFile.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
}
