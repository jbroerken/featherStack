//
//  VMSetList.swift
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


final class FSSetListViewModel: ObservableObject {
    
    //************************************************************
    // Types
    //************************************************************
    
    struct FSSelection {
        
        //************************************************************
        // Variables
        //************************************************************
        
        fileprivate(set) var i_Entry: Int = 0
        fileprivate(set) var s_Title: String = ""
        fileprivate(set) var e_Mode: FSActiveSetViewModel.Mode = .Practice
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    @Published private var b_Changed = false // Toggle
    
    private let c_Context = FSContext()
    private(set) var c_Selection = FSSelection()
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the set list view model.
     */
    
    init() {
        do {
            try c_Context.Reload()
            b_Changed.toggle()
        } catch let e as FSContext.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
    
    //************************************************************
    // Add Set
    //************************************************************
    
    /**
     *  Add a set to the context.
     *
     *  - Parameter s_URL: The url of the new set.
     */
    
    func AddSet(_ s_URL: URL) -> Void {
        do {
            try c_Context.AddSet(s_URL)
            b_Changed.toggle()
        } catch let e as FSContext.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
    
    //************************************************************
    // Select Set
    //************************************************************
    
    /**
     *  Set the current card set entry selection.
     *
     *  - Parameter i_Entry: The set entry index.
     *  - Parameter s_Title: The set title.
     *  - Parameter e_Mode: The set mode.
     */
    
    func SelectEntry(i_Entry: Int, s_Title: String, e_Mode: FSActiveSetViewModel.Mode) -> Void {
        c_Selection.i_Entry = i_Entry
        c_Selection.s_Title = s_Title
        c_Selection.e_Mode = e_Mode
        
        b_Changed.toggle()
    }
    
    /**
     *  Get the currently selected card set from the context.
     *
     *  - Returns: The currently selected card set.
     */
    
    func GrabSet() -> FSCardSet? {
        do {
            return try FSCardSet(c_Context: c_Context, i_Entry: c_Selection.i_Entry)
        } catch let e as FSCardSet.FSError {
            FSCommon.Log(e.s_String)
            return nil
        } catch {
            return nil
        }
    }
    
    //************************************************************
    // Remove Set
    //************************************************************
    
    /**
     *  Remove a card set from the context. The set will be deleted.
     *
     *  - Parameter i_Entry: The set entry to remove.
     */
    
    func RemoveSet(_ i_Entry: Int) -> Void {
        do {
            try c_Context.RemoveSet(i_Entry)
            b_Changed.toggle()
        } catch let e as FSContext.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Get a entry for a set.
     *
     *  - Parameter i_Entry: The set entry to request.
     *
     *  - Returns: The requested set.
     */
    
    func GetEntry(_ i_Entry: Int) -> FSContext.FSEntry? {
        if (i_Entry < 0 || i_Entry >= c_Context.l_SetEntry.count) {
            return nil
        }
        
        return c_Context.l_SetEntry[i_Entry]
    }
    
    /**
     *  Get the total card set count.
     *
     *  - Returns: The total card set count.
     */
    
    func GetSetCount() -> Int {
        return c_Context.l_SetEntry.count
    }
}
