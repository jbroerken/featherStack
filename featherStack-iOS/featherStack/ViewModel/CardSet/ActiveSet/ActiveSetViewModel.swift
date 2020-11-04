//
//  ActiveSetViewModel.swift
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
    // Variables
    //************************************************************
    
    @Published private(set) var c_Card: FSCard? = nil
    
    private var c_Set: FSCardSet? = nil
    
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
     *  - Parameter c_Card: The card set to manage.
     */
    
    func Validate(_ c_Set: FSCardSet) -> Void {
        // Reset first
        Invalidate()
        
        self.c_Set = c_Set
    }
    
    /**
     *  Invalidate the view model, destroying data.
     */
    
    func Invalidate() -> Void {
        c_Card = nil
        c_Set = nil
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
        
        switch (c_Owner.GetRemainingCount()) {
            case 1:
                if (c_Card == nil) {
                    fallthrough
                }
                
                if (c_Card!.b_Completed) {
                    c_Card = nil // Last card completed, destroy
                } else {
                    objectWillChange.send() // Not completed, reuse
                }
                
            default: c_Card = FSCard(c_Owner) // nil or more cards
        }
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Get the total amount of cards.
     *
     *  - Returns: The total card count.
     */
    
    func GetTotalCount() -> Int {
        guard let c_Current = c_Set else {
            return 0
        }
        
        return c_Current.GetTotalCount()
    }
    
    /**
     *  Get the amount of remaining cards.
     *
     *  - Returns: The remaining card count.
     */
    
    func GetRemainingCount() -> Int {
        guard let c_Current = c_Set else {
            return 0
        }
        
        return c_Current.GetRemainingCount()
    }
    
    /**
     *  Get the directory path for this card.
     *
     *  - Returns: The card directory path.
     */
    
    func GetDirPath() -> String {
        guard let c_Current = c_Set else {
            return ""
        }
        
        return c_Current.GetDirPath()
    }
}
