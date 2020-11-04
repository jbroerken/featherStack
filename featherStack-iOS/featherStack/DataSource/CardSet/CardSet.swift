//
//  CardSet.swift
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
    private var p_CardSet: FSContext.CCardSet?
    
    //************************************************************
    // Init / Deinit
    //************************************************************
    
    /**
     *  Initialize the card set.
     *
     *  - Parameter c_Context: The context to create the card set with.
     *  - Parameter i_Entry: The card set entry to create from the given context.
     *
     *  - Throws: `FSError.NoSet`
     */
    
    init(c_Context: FSContext, i_Entry: Int) throws {
        self.c_Context = c_Context
        
        do {
            p_CardSet = try c_Context.CreateSet(i_Entry)
        } catch {
            throw FSError.NoSet
        }
    }
    
    /**
     *  Deinitialize the card set.
     */
    
    deinit {
        if let p_Current = p_CardSet {
            do {
                p_CardSet = try c_Context.DestroySet(p_Current)
            } catch let error as FSContext.FSError {
                FSCommon.Log(error.s_String)
            } catch {}
        }
    }
    
    //************************************************************
    // Card
    //************************************************************
    
    /**
     *  Load a random card from the set.
     *
     *  - Parameter p_Callback The callback to perform on load completion.
     *
     *  - Throws: `FSError.NoSet`
     */
    
    func LoadCard(_ p_Location: CCardLocation) throws -> Void {
        guard let p_Current = p_CardSet else {
            throw FSError.NoSet
        }
        
        FSC_CSGrabCard(p_Current, p_Location)
    }
    
    /**
     *  Return a card to the set.
     *
     *  - Parameter p_Card: The card to destroy.
     *  - Parameter b_Completed: True if the card was completed, false if not.
     *
     *  - Throws: `FSError.NoSet`
     *
     *  - Returns: The new card pointer to assign.
     */
    
    @discardableResult func DestroyCard(p_Card: CCard, b_Completed: Bool) throws -> CCard? {
        guard let p_Current = p_CardSet else {
            throw FSError.NoSet
        }
        
        return FSC_CSReturnCard(p_Current, p_Card, b_Completed ? 0 : -1)
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
        guard let p_Current = p_CardSet else {
            return 0
        }
        
        return FSC_CSGetTotalCount(p_Current)
    }
    
    /**
     *  Get the amount of remaining cards.
     *
     *  - Returns: The remaining card count.
     */
    
    func GetRemainingCount() -> Int {
        guard let p_Current = p_CardSet else {
            return 0
        }
        
        return FSC_CSGetRemainingCount(p_Current)
    }
    
    /**
     *  Get the directory path for this card.
     *
     *  - Returns: The card directory path.
     */
    
    func GetDirPath() -> String {
        guard let p_Current = p_CardSet else {
            return ""
        }
        
        return String(cString: FSC_CSGetDirPath(p_Current))
    }
}
