//
//  MCardSet.swift
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


final class FSCardSet {
    
    //************************************************************
    // Types
    //************************************************************
    
    typealias CCard = OpaquePointer
    typealias CCardLocation = UnsafeMutablePointer<CCard?>
    
    enum FSError: Error {
        case NoSet
        
        var s_String: String {
            switch (self) {
                case .NoSet: return "No FSC_CardSetOpaque to use"
            }
        }
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let c_Context: FSContext
    private var p_Set: FSContext.CCardSet?
    
    var s_Title: String {
        guard let p_Current = p_Set else {
            return ""
        }
        
        let p_String = FSC_CSGetTitle(p_Current)
        return p_String != nil ? String(cString: p_String!) : ""
    }
    var i_TotalCount: Int {
        return p_Set != nil ? FSC_CSGetTotalCount(p_Set!) : 0
    }
    var i_RemainingCount: Int {
        return p_Set != nil ? FSC_CSGetRemainingCount(p_Set!) : 0
    }
    var s_DirPath: String {
        guard let p_Current = p_Set else {
            return ""
        }
        
        let p_String = FSC_CSGetDirPath(p_Current)
        return p_String != nil ? String(cString: p_String!) : ""
    }
    
    // NOTE: The set loads, so the callback belongs in the set
    fileprivate let p_Callback: FSC_Callback = { p_Source, p_Destination in
        if let p_Destination = p_Destination {
            p_Destination.pointee = p_Source
        }
    }
    
    //************************************************************
    // Init / Deinit
    //************************************************************
    
    /**
     *  Initialize the card set.
     *
     *  - Parameter c_Context: The context to create the card set with.
     *  - Parameter i_Entry: The card set entry to create from the given context.
     *
     *  - Throws: `FSError.NoSet`.
     */
    
    init(c_Context: FSContext, i_Entry: Int) throws {
        self.c_Context = c_Context
        
        do {
            p_Set = try c_Context.CreateSet(i_Entry)
        } catch {
            throw FSError.NoSet
        }
    }
    
    /**
     *  Deinitialize the card set.
     */
    
    deinit {
        guard let p_Current = p_Set else {
            return
        }
        
        do {
            p_Set = try c_Context.DestroySet(p_Current)
        } catch let e as FSContext.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
    
    //************************************************************
    // Card
    //************************************************************
    
    /**
     *  Load a random card from the set.
     *
     *  - Parameter p_Callback The callback to perform on load completion.
     *
     *  - Throws: `FSError.NoSet`.
     */
    
    func LoadCard(_ p_Location: CCardLocation) throws -> Void {
        guard let p_Current = p_Set else {
            throw FSError.NoSet
        }
        
        FSC_CSGrabCard(p_Current, p_Callback, p_Location)
    }
    
    /**
     *  Return a card to the set.
     *
     *  - Parameter p_Card: The card to destroy.
     *  - Parameter b_Completed: True if the card was completed, false if not.
     *
     *  - Throws: `FSError.NoSet`.
     *
     *  - Returns: The new card pointer to assign.
     */
    
    @discardableResult func DestroyCard(p_Card: CCard, b_Completed: Bool) throws -> CCard? {
        guard let p_Current = p_Set else {
            throw FSError.NoSet
        }
        
        return FSC_CSReturnCard(p_Current, p_Card, b_Completed ? 0 : -1)
    }
}
