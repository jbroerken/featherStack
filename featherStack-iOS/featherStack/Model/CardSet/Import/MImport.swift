//
//  MImport.swift
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
import Zip


class FSImport {
    
    //************************************************************
    // Types
    //************************************************************
    
    private typealias CImportFile = OpaquePointer
    
    enum FSError: Error {
        case AlreadyImported
        case NoImportFile
        case NoSetFile
        case NoSetDirectory
        case CopyFailed
        
        var s_String: String {
            switch (self) {
                case .AlreadyImported: return "This card set has already been imported"
                case .NoImportFile: return "Failed to open import file"
                case .NoSetFile: return "No card set file info found"
                case .NoSetDirectory: return "No card set directory info found"
                case .CopyFailed: return "File / directory copy failed"
            }
        }
    }
    
    //************************************************************
    // Content
    //************************************************************
    
    /**
     *  Remove content at a given path.
     *
     *  - Parameter s_Path: The path to the content.
     */
    
    private func RemoveContent(_ s_Path: String) -> Void {
        do {
            if (FileManager.default.fileExists(atPath: s_Path)) {
                try FileManager.default.removeItem(atPath: s_Path)
            }
        } catch let e {
            FSCommon.Log(e.localizedDescription)
        }
    }
    
    /**
     *  Copy content from a given path.
     *
     *  - Parameter s_Source: The path to the source content.
     *  - Parameter s_Destination: The path to the content destination.
     *
     *  - Throws: `FSError.CopyFailed`, `Error`.
     */
    
    private func CopyContent(s_Source: String, s_Destination: String) throws -> Void {
        if (!FileManager.default.fileExists(atPath: s_Source)) {
            throw FSError.CopyFailed
        }
        
        // Grab dirpath substring and add dirs, then copy
        if let c_Index = s_Destination.lastIndex(of: "/") {
            let s_Directories = String(s_Destination.prefix(upTo: c_Index))
            
            try FileManager.default.createDirectory(atPath: s_Directories, withIntermediateDirectories: true, attributes: nil)
            try FileManager.default.copyItem(atPath: s_Source, toPath: s_Destination)
            
            return
        }
    }
    
    //************************************************************
    // Zip
    //************************************************************
    
    /**
     *  Copy the set zip to a default destination.
     *
     *  - Parameter s_ZipURL: The url to the source zip file.
     *
     *  - Throws: `FSCommon.FSError`, `Error`.
     *
     *  - Returns: The path to the copied default zip location.
     */
    
    private func CopyZip(_ s_ZipURL: URL) throws -> URL {
        // Grab the destination path
        let s_Path = try FSCommon.GetDocumentsPath("Import.zip")
        
        // Do we have to remove the old file first?
        if (FileManager.default.fileExists(atPath: s_Path)) {
            try FileManager.default.removeItem(atPath: s_Path)
        }
        
        // Copy
        try FileManager.default.copyItem(atPath: s_ZipURL.path, toPath: s_Path)
        
        // Done, return url
        return URL(fileURLWithPath: s_Path)
    }
    
    /**
     *  Extract a zip file.
     *
     *  - Parameter s_ZipURL: The url to the set zip file.
     *
     *  - Throws: `Error`.
     *
     *  - Returns: The path to the extracted directory.
     */
    
    private func ExtractZip(_ s_ZipURL: URL) throws -> URL {
        do {
            let s_Path = try Zip.quickUnzipFile(s_ZipURL)
            RemoveContent(s_ZipURL.path)
            
            return s_Path
            
        } catch let e { // We need to catch ourselfs to always remove the zip
            RemoveContent(s_ZipURL.path)
            throw e
        }
    }
    
    //************************************************************
    // Import
    //************************************************************
    
    /**
     *  Remove and log an error.
     *
     *  - Parameter e_Error: The error to log and throw.
     *  - Parameter s_Remove: The content to remove (if any).
     */
    
    private func ImportFailed(e_Error: FSError, s_Remove: String? = nil) -> FSError {
        if let s_Path = s_Remove {
            RemoveContent(s_Path)
        }
        
        if (FSC_EGetError().rawValue > -1) {
            FSCommon.Log(String(cString: FSC_EGetErrorString()))
            FSC_EReset()
        }
        
        return e_Error
    }
    
    /**
     *  Import a card set.
     *
     *  - Parameter s_ZipURL: The url to the set zip file.
     *
     *  - Throws: `FSError.NoImportFile`, `FSError.NoSetDirectory`, `FSError.AlreadyImported`,
     *            `FSError.CopyFailed`, `FSError.NoSetFile`, `Error`.
     */
    
    func Import(p_Context: FSContext.CContext, s_ZipURL: URL) throws -> Void {
        // Optionals, defined for exception cleanup
        var s_Extracted: String? = nil
        var s_DestinationDir: String? = nil
        var p_ImportFile: CImportFile? = nil
        
        do {
            // First, copy and extract
            s_Extracted = try ExtractZip(CopyZip(s_ZipURL)).path + "/"
            
            // Next, open the import file
            p_ImportFile = FSC_IFCreate(s_Extracted! + "Import.txt")
            if (p_ImportFile == nil) {
                throw ImportFailed(e_Error: .NoImportFile)
            }
            
            // Get the source destination path
            guard let p_DirName = FSC_IFGetDirName(p_ImportFile!) else {
                throw ImportFailed(e_Error: .NoSetDirectory)
            }
            let s_SourceDir = s_Extracted! + String(cString: p_DirName) + "/"
            s_DestinationDir = try FSCommon.GetDocumentsPath(String(cString: p_DirName)) + "/"
            
            // Does this set already exist?
            if (FileManager.default.fileExists(atPath: s_DestinationDir!)) {
                throw ImportFailed(e_Error: .AlreadyImported)
            }
            
            // Copy content first so that failed copies don't add invalid sets
            let i_FileCount = FSC_IFGetFileCount(p_ImportFile!)
            for i in 0 ..< i_FileCount {
                // Check file path first
                guard let p_FilePath = FSC_IFGetFilePath(p_ImportFile!, i) else {
                    throw ImportFailed(e_Error: .CopyFailed,
                                       s_Remove: s_DestinationDir!)
                }
                
                // Try to copy, remove on error
                do {
                    try CopyContent(s_Source: s_SourceDir + String(cString: p_FilePath),
                                    s_Destination: s_DestinationDir! + String(cString: p_FilePath))
                } catch let e {
                    RemoveContent(s_DestinationDir!) // Remove ourselves, and just throw
                    throw e
                }
            }
            
            // We copied all files, now add to context set list
            guard let p_SetFile = FSC_IFGetSetFile(p_ImportFile!) else {
                throw ImportFailed(e_Error: .NoSetFile,
                                   s_Remove: s_DestinationDir!)
            }
            
            if (FSC_COAddSet(p_Context, (s_Extracted! + String(cString: p_SetFile)).cString(using: .utf8)!) < 0) {
                throw ImportFailed(e_Error: .NoSetFile,
                                   s_Remove: s_DestinationDir!)
            }
            
            // Done, clean up
            p_ImportFile = FSC_IFDestroy(p_ImportFile!)
            RemoveContent(s_Extracted!)
            
        } catch let e {
            if let p_File = p_ImportFile {
                p_ImportFile = FSC_IFDestroy(p_File)
            }
            
            if let s_Path = s_Extracted {
                RemoveContent(s_Path)
            }
            
            throw e
        }
    }
}
