//
//  MCard.swift
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


final class FSCard {
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let c_Set: FSCardSet
    private var p_Card: FSCardSet.CCard? = nil
    
    var b_Completed: Bool = false
    var b_Loaded: Bool {
        return p_Card != nil
    }
    var s32_Type: Int32 {
        return p_Card != nil ? FSC_CDGetType(p_Card!) : -1
    }
    var s_Data: String {
        guard let p_Current = p_Card else {
            return ""
        }
        
        let p_String = FSC_CDGetData(p_Current)
        return p_String != nil ? String(cString: p_String!) : ""
    }
    var s_Question: String {
        guard let p_Current = p_Card else {
            return ""
        }
        
        let p_String = FSC_CDGetQuestion(p_Current)
        return p_String != nil ? String(cString: p_String!) : ""
    }
    var s_Answer: String {
        guard let p_Current = p_Card else {
            return ""
        }
        
        let p_String = FSC_CDGetAnswer(p_Current)
        return p_String != nil ? String(cString: p_String!) : ""
    }
    
    //************************************************************
    // Init / Deinit
    //************************************************************
    
    /**
     *  Initialize the card.
     *
     *  - Parameter c_Set: The card set this card belongs to.
     */
    
    init(_ c_Set: FSCardSet) {
        self.c_Set = c_Set // Store for deinit, ref needs to exist
        
        do {
            try c_Set.LoadCard(&p_Card)
        } catch let e as FSCardSet.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
    
    /**
     *  Deinitialize the card.
     */
    
    deinit {
        guard let p_Current = p_Card else {
            return
        }
        
        do {
            try c_Set.DestroyCard(p_Card: p_Current, b_Completed: b_Completed)
        } catch let e as FSCardSet.FSError {
            FSCommon.Log(e.s_String)
        } catch {}
    }
}
