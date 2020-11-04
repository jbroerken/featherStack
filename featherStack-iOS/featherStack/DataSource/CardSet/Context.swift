//
//  Context.swift
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
import Zip


final class FSContext {
    
    //************************************************************
    // Types
    //************************************************************
    
    typealias CCardSet = OpaquePointer
    
    final class FSEntry: Identifiable {
        
        //************************************************************
        // Variables
        //************************************************************
        
        let s_ID = UUID()
        
        fileprivate var i_CoreIndex: Int
        
        let s_Title: String
        let s_Subtitle: String
        let s_IconPath: String
        
        //************************************************************
        // Init
        //************************************************************
        
        /**
         *  Initialize the available card set info.
         *
         *  - Parameter i_CoreIndex: The fscore index of this set.
         *  - Parameter s_Title: The card set title.
         *  - Parameter s_Subtitle: The card set subtitle.
         *  - Parameter s_IconPath: The path to the set icon file.
         */
        
        init(i_CoreIndex: Int, s_Title: String, s_Subtitle: String, s_IconPath: String) {
            self.i_CoreIndex = i_CoreIndex
            self.s_Title = s_Title
            self.s_Subtitle = s_Subtitle
            self.s_IconPath = s_IconPath
        }
    }
    
    enum FSError: Error {
        case NoContext
        case NoSet
        case CreateFailed
        case InvalidSet
        case ImportFailed
        case InvalidImport
        
        var s_String: String {
            switch (self) {
                case .NoContext: return "No FSCore context to use"
                case .CreateFailed: return "Failed to create a card set"
                case .NoSet: return "No set found"
                case .InvalidSet: return "Invalid set data"
                case .ImportFailed: return "Failed to import new set"
                case .InvalidImport: return "Invalid import file"
            }
        }
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    private(set) var l_SetEntry: [FSEntry] = [FSEntry]()
    
    private var p_Context: OpaquePointer? = nil
    
    //************************************************************
    // Init / Deinit
    //************************************************************
    
    /**
     *  Initialize the context.
     */
    
    init() {
        // Check text file and create if missing, fscore requires the files
        // to exist. Failing to create a file will cause reload() to fail
        do {
            let s_Path = try FSCommon.GetDocumentsPath("Context.txt")
            
            if (!FSCommon.FileExists(s_Path)) { // Empty write
                try "".write(to: URL(fileURLWithPath: s_Path),
                             atomically: true,
                             encoding: .utf8)
            }
        } catch let error as FSCommon.FSError {
            FSCommon.Log(error.s_String)
        } catch {
            FSCommon.Log(error.localizedDescription)
        }
    }
    
    /**
     *  Deinitialize the context.
     */
    
    deinit {
        if let context = p_Context {
            FSC_CODestroy(context)
        }
    }
    
    //************************************************************
    // Reload
    //************************************************************
    
    /**
     *  Reload the context.
     *
     *  - Throws: `FSError.NoContext`, `FSError.InvalidSet`
     */
    
    func Reload() throws -> Void {
        // Complete clear, we don't want to work on old data
        l_SetEntry.removeAll()
        
        // Context recreation
        // NOTE: No need to destroy the old context if a new one failed to load
        do {
            guard let p_New = try FSC_COCreate(FSCommon.GetDocumentsPath(), "Context.txt", 5) else {
                FSCommon.Log(String(cString: FSC_EGetErrorString()))
                throw FSError.NoContext
            }
            
            if let p_Old = p_Context {
                p_Context = FSC_CODestroy(p_Old)
            }
            
            p_Context = p_New
        } catch let error as FSError {
            FSCommon.Log(error.s_String)
            throw FSError.NoContext
        }
        
        // We recreate the entry list next
        let i_SetCount = FSC_COGetSetCount(p_Context!)
        for i in 0 ..< i_SetCount { // fscore indexes
            AddEntry(i)
        }
    }
    
    //************************************************************
    // Current Set
    //************************************************************
    
    /**
     *  Create a card set by context index.
     *
     *  - Parameter i_Entry: The card set entry to create.
     *
     *  - Throws: `FSError.NoContext`, `FSError.CreateFailed`, `FSError.NoSet`
     *
     *  - Returns: The card set created.
     */
    
    func CreateSet(_ i_Entry: Int) throws -> CCardSet {
        if (i_Entry < 0 || i_Entry >= l_SetEntry.count) { // We need to grab the set entry
            throw FSError.NoSet
        }
        
        guard let p_Current = p_Context else {
            throw FSError.NoContext
        }
        
        // We check for the set error ourselves
        guard let p_Set = FSC_COCreateSet(p_Current, l_SetEntry[i_Entry].i_CoreIndex) else {
            FSCommon.Log(String(cString: FSC_EGetErrorString()))
            throw FSError.CreateFailed
        }
        
        return p_Set
    }
    
    /**
     *  Destroy a card set.
     *
     *  - Parameter p_Set: The card set to destroy.
     *
     *  - Returns: The new card set pointer to assign.
     */
    
    @discardableResult func DestroySet(_ p_Set: CCardSet) throws -> CCardSet? {
        guard let p_Current = p_Context else {
            throw FSError.NoContext
        }
        
        return FSC_CODestroySet(p_Current, p_Set)
    }
    
    //************************************************************
    // Set List
    //************************************************************
    
    /**
     *  Add a set entry.
     *
     *  - Parameter i_CoreIndex: The fscore set to add as a entry.
     */
    
    private func AddEntry(_ i_CoreIndex: Int) -> Void {
        if (i_CoreIndex < 0 && i_CoreIndex >= FSC_COGetSetCount(p_Context!)) {
            return
        }
        
        // Add to available
        do {
            let s_Title = try FSCommon.UTF8ToString(FSC_COGetSetTitle(p_Context!, i_CoreIndex))
            let s_Subtitle = try FSCommon.UTF8ToString(FSC_COGetSetSubtitle(p_Context!, i_CoreIndex))
            let s_IconPath = try FSCommon.UTF8ToString(FSC_COGetSetIconPath(p_Context!, i_CoreIndex))
            
            let c_Set = FSEntry(i_CoreIndex: i_CoreIndex,
                                s_Title: s_Title,
                                s_Subtitle: s_Subtitle,
                                s_IconPath: s_IconPath)
            
            l_SetEntry.insert(c_Set, at: 0)
        } catch let error as FSCommon.FSError {
            FSCommon.Log(error.s_String)
        } catch {
            FSCommon.Log(error.localizedDescription)
        }
    }
    
    /**
     *  Add a card set to the context. The available entry list will be updated.
     *
     *  - Parameter s_Source: The source url.
     *
     *  - Throws: `FSError.NoContext`, `FSError.ImportFailed`
     */
    
    func AddSet(_ s_Source: URL) throws -> Void {
        
        //
        // This could be a lot nicer:
        //
        // - What happens if a zip file contains more files than the usual types (txt, png)?
        // - The import file could allow for a much better structure using an identifier
        // - What about zip files which include a diretory to the set (set2.zip -> set2/set2/Import.txt)
        // - What about coflicting dir names which respond to different sets?
        //
        
        guard let p_Current = p_Context else {
            throw FSError.NoContext
        }
        
        do {
            // Copy to documents and extract
            let s_LocalZip = try FSCommon.GetDocumentsPath("current.zip")
            try FSCommon.CopyContent(s_SourcePath: s_Source.path,
                                     s_DestinationPath: s_LocalZip)
            
            // Special block here, we always remove the .zip
            var s_Destination: URL
            do {
                s_Destination = try Zip.quickUnzipFile(s_Source)
                FSCommon.RemoveContent(s_LocalZip)
            } catch {
                FSCommon.RemoveContent(s_LocalZip)
                throw error // Handoff
            }
            
            // Read import file and check conflict
            do {
                let s_Content = try String(contentsOf: s_Destination.appendingPathComponent("Import.txt"),
                                           encoding: .utf8).components(separatedBy: .newlines)
                
                if (s_Content.count != 2) {
                    throw FSError.InvalidImport // We need set dir and file
                }
                
                // Already Existing?
                let b_Exists = try FSCommon.FileExists(FSCommon.GetDocumentsPath(s_Content[1]))
                if (b_Exists) {
                    return;
                }
                
                // Copy set dir
                try FSCommon.CopyContent(s_SourcePath: s_Destination.appendingPathComponent(s_Content[1]).path,
                                         s_DestinationPath: FSCommon.GetDocumentsPath(s_Content[1]))
                
                // Import text to context
                if (FSC_COAddSet(p_Current, s_Destination.appendingPathComponent(s_Content[0]).path.cString(using: .utf8)!) < 0) {
                    throw FSError.InvalidSet
                }
                
                // All done, register and clean uo
                AddEntry(FSC_COGetSetCount(p_Current) - 1) // Never a flip, set added to fscore
                FSCommon.RemoveContent(s_Destination.path)
            } catch {
                FSCommon.RemoveContent(s_Destination.path)
                throw error
            }
        } catch let error as FSError {
            FSCommon.Log(error.s_String)
            throw FSError.ImportFailed
        } catch let error {
            FSCommon.Log(error.localizedDescription)
            throw FSError.ImportFailed
        }
    }
    
    /**
     *  Remove a card set from the context. The available entry list will be updated.
     *
     *  - Parameter i_Entry: The card set entry (and resulting fscore index) to remove.
     *
     *  - Throws: `FSError.NoContext`
     */
    
    func RemoveSet(_ i_Entry: Int) throws -> Void {
        if (i_Entry < 0 || i_Entry >= l_SetEntry.count) { // We need to grab the set entry
            throw FSError.NoSet
        }
        
        guard let p_Current = p_Context else {
            throw FSError.NoContext
        }
        
        // Get fscore index, lists are stored in reverse (newest on top)
        let i_CoreIndex = l_SetEntry[i_Entry].i_CoreIndex
        
        do {
            let s_Path = try FSCommon.UTF8ToString(FSC_COGetSetDirPath(p_Current, i_CoreIndex))
            
            if (FSC_CORemoveSet(p_Current, i_CoreIndex) < 0) {
                FSCommon.Log(String(cString: FSC_EGetErrorString()))
                return
            }
            
            // We need to remove the entry and correct the core indexes
            l_SetEntry.remove(at: i_Entry)
            
            // NOTE: Newest (highest core index) is stored first, so we
            //       correct everything until the element before the
            //       removed one
            for i in 0 ..< i_Entry {
                l_SetEntry[i].i_CoreIndex -= 1
            }
            
            FSCommon.RemoveContent(s_Path)
        } catch let error as FSCommon.FSError {
            FSCommon.Log(error.s_String)
        }
    }
}
