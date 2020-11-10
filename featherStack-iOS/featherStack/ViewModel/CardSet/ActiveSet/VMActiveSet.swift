//
//  VMActiveSet.swift
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


final class FSActiveSetViewModel: ObservableObject {
    
    //************************************************************
    // Types
    //************************************************************
    
    enum FSMode {
        case Practice
        case Read
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    @Published private(set) var c_Card: FSCard? = nil // NextCard() notify
    
    private var c_Set: FSCardSet? = nil
    private(set) var e_Mode: FSMode? = nil
    
    var s_Title: String {
        return c_Set != nil ? c_Set!.s_Title : ""
    }
    var i_TotalCount: Int {
        return c_Set != nil ? c_Set!.i_TotalCount : 0
    }
    var i_RemainingCount: Int {
        return c_Set != nil ? c_Set!.i_RemainingCount : 0
    }
    var s_DirPath: String {
        return c_Set != nil ? c_Set!.s_DirPath : ""
    }
    
    //************************************************************
    // Deinit
    //************************************************************
    
    /**
     *  Deinitialize the active set view model.
     */
    
    deinit {
        Invalidate()
    }
    
    //************************************************************
    // Model
    //************************************************************
    
    /**
     *  Validate the view model, creating data.
     *
     *  - Parameter c_Set: The card set to manage.
     *  - Parameter e_Mode: The card set view mode to use.
     */
    
    func Validate(c_Set: FSCardSet, e_Mode: FSMode) -> Void {
        // Reset first
        Invalidate()
        
        // Update set ref
        self.c_Set = c_Set
        self.e_Mode = e_Mode
    }
    
    /**
     *  Invalidate the view model, destroying data.
     */
    
    func Invalidate() -> Void {
        c_Card = nil // Before set!
        c_Set = nil
        e_Mode = nil
    }
    
    //************************************************************
    // Card
    //************************************************************
    
    /**
     *  Get the next available card from the set.
     *
     *  - Returns: A new card.
     */
    
    func NextCard() -> Void {
        // Update ref with new card and return
        guard let c_Owner = c_Set else {
            return
        }
        
        switch (c_Owner.i_RemainingCount) {
            case 1:
                if (c_Card == nil) {
                    fallthrough // Special: Set has only 1 card
                }
                
                if (c_Card!.b_Completed) {
                    c_Card = nil // Last card completed, destroy
                } else {
                    objectWillChange.send() // Not completed, reuse
                }
                
            default: c_Card = FSCard(c_Owner) // nil or more cards
        }
    }
}
