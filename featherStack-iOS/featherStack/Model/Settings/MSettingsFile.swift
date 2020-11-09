//
//  MSettingsFile.swift
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


final class FSSettingsFile {
    
    //************************************************************
    // Types
    //************************************************************
    
    enum FSError: Error {
        case NoFileURL
        case IO
        
        var s_String: String {
            switch (self) {
                case .NoFileURL: return "Failed to create file url"
                case .IO: return "Read / write operation failed"
            }
        }
    }
    
    enum FSSetting: Int, CaseIterable {
        case TCard = 0
        case CDSwipeRight = 1
        case SClearTextOnNav = 2
        case SExactString = 3
        
        var s_String: String {
            switch (self) {
                case .TCard: return "Tutorial_Card="
                case .CDSwipeRight: return "Card_SwipeRight="
                case .SClearTextOnNav: return "Search_ClearTextOnNav="
                case .SExactString: return "Search_ExactString="
            }
        }
        
        var b_Default: Any {
            switch (self) {
                case .TCard: return true
                case .CDSwipeRight: return true
                case .SClearTextOnNav: return false
                case .SExactString: return false
            }
        }
    };
    
    //************************************************************
    // Variables
    //************************************************************
    
    private(set) var l_Setting = [Any]()
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the settings file.
     *
     *  - Parameter l_Setting: The default settings values to use.
     */
    
    init(_ l_Setting: [Any]? = nil) {
        // Force unwrap with nil check
        if (l_Setting != nil && l_Setting!.count >= FSSetting.allCases.count) {
            self.l_Setting.append(contentsOf: l_Setting!)
        } else {
            FSSetting.allCases.forEach {
                self.l_Setting.append($0.b_Default)
            }
        }
    }
    
    //************************************************************
    // Read
    //************************************************************
    
    /**
     *  Read the settings file.
     *
     *  - Throws: `FSError.NoFileURL`, `FSError.IO`.
     */
    
    func Read() throws -> Void {
        guard let s_Directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw FSError.NoFileURL
        }
        
        let s_File = s_Directory.appendingPathComponent("Settings.cfg")
        
        do {
            let s_Content = try String(contentsOf: s_File, encoding: .utf8).components(separatedBy: .newlines)
            
            for s_String in s_Content {
                FSSetting.allCases.forEach {
                    if (s_String.prefix($0.s_String.count) == $0.s_String) { // Beginning has to match
                        // Grab value
                        let s_Value = s_String.suffix(s_String.count - $0.s_String.count)
                        
                        switch ($0) {
                            // Boolean
                            case .TCard: fallthrough
                            case .CDSwipeRight: fallthrough
                            case .SClearTextOnNav: fallthrough
                            case .SExactString: l_Setting[$0.rawValue] = (s_Value == "TRUE" ? true : false)
                        }
                    }
                }
            }
        } catch {
            FSCommon.Log(error.localizedDescription)
            throw FSError.IO
        }
    }
    
    //************************************************************
    // Write
    //************************************************************
    
    /**
     *  Overwrite the settings file.
     *
     *  - Throws: `FSError.NoFileURL`, `FSError.IO`.
     */
    
    func Write() throws -> Void {
        guard let s_Directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw FSError.NoFileURL
        }
        
        let s_File = s_Directory.appendingPathComponent("Settings.cfg")
        var s_Content = ""
        
        FSSetting.allCases.forEach {
            s_Content += $0.s_String
            
            // We group based on value type
            switch ($0) {
                // Boolean
                case .TCard: fallthrough
                case .CDSwipeRight: fallthrough
                case .SClearTextOnNav: fallthrough
                case .SExactString: s_Content += (l_Setting[$0.rawValue] as? Bool ?? false) ? "TRUE" : "FALSE"
            }
            
            s_Content += "\n"
        }
        
        do {
            try s_Content.write(to: s_File, atomically: false, encoding: .utf8)
        } catch {
            FSCommon.Log(error.localizedDescription)
            throw FSError.IO
        }
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Get a settings value.
     *
     *  - Parameter e_Setting: The settings value to recieve.
     */
    
    func GetValue(e_Setting: FSSetting) -> Any? {
        if (e_Setting.rawValue < l_Setting.count) {
            return l_Setting[e_Setting.rawValue]
        }
        
        return nil
    }
    
    //************************************************************
    // Setters
    //************************************************************
    
    /**
     *  Set a settings value.
     *
     *  - Parameter e_Setting: The settings value.
     *  - Parameter a_Value: The value to set.
     */
    
    func SetValue(e_Setting: FSSetting, a_Value: Any) -> Void {
        if (e_Setting.rawValue < l_Setting.count) {
            l_Setting[e_Setting.rawValue] = a_Value
        }
    }
}
