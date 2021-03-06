//
//  MCommon.swift
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


public final class FSCommon {
    
    //************************************************************
    // Types
    //************************************************************
    
    public enum FSError: Error {
        case NoDocumentsPath
        case Encoding
        case InvalidPtr
        case Move
        case Copy
        case NoFile
        
        var s_String: String {
            switch (self) {
                case .NoDocumentsPath: return "Failed to get file manager documents path"
                case .Encoding: return "Encountered an encoding issue"
                case .InvalidPtr: return "Invalid pointer given"
                case .Move: return "Failed to move item"
                case .Copy: return "Failed to copy item"
                case .NoFile: return "File not found at given path"
            }
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Disabled init for FSCommon.
     */
    
    private init() {}
    
    //************************************************************
    // Log
    //************************************************************
    
    public static func Log(_ s_String: String) -> Void {
        #if DEBUG
        NSLog(s_String)
        #endif
    }
    
    //************************************************************
    // Files
    //************************************************************
    
    /**
     *  Check if a file exists at a given path.
     *
     *  - Parameter s_FilePath: The path to the file.
     *
     *  - Returns: `true` if the file exists, `false` if not.
     */
    
    public static func FileExists(_ s_FilePath: String) -> Bool {
        return FileManager.default.fileExists(atPath: s_FilePath)
    }
    
    /**
     *  Remove a file or directory at a given path.
     *
     *  - Parameter s_FilePath: The path to the file or directory.
     */
    
    public static func RemoveContent(_ s_FilePath: String) -> Void {
        if (FileManager.default.fileExists(atPath: s_FilePath)) {
            do {
                try FileManager.default.removeItem(atPath: s_FilePath)
            } catch {
                FSCommon.Log(error.localizedDescription)
            }
        }
    }
    
    /**
     *  Get the file path to the documents folder.
     *
     *  - Parameter s_Append: The string to appent to the path if required.
     *
     *  - Throws: `FSError.NoDocumentsPath`.
     *
     *  - Returns: The path to the documents folder.
     */
    
    public static func GetDocumentsPath(_ s_Append: String? = nil) throws -> String {
        let l_Paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // @TODO: Can this actually happen?
        if (l_Paths.isEmpty) {
            throw FSError.NoDocumentsPath
        }
        
        var s_Path = l_Paths[0].path
        
        // Seperator
        if (s_Path.isEmpty || s_Path.last! != "/") {
            s_Path += "/"
        }
        
        // Add append if it exists
        if let s_Append = s_Append {
            s_Path += s_Append
        }
        
        return s_Path
    }
}
