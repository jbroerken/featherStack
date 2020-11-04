//
//  Card.swift
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


final class FSCard {
    
    //************************************************************
    // Types
    //************************************************************
    
    enum FSString {
        case Data
        case Question
        case Answer
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    private let c_CardSet: FSCardSet
    private var p_Card: FSCardSet.CCard? = nil
    private(set) var b_Completed = false
    
    //************************************************************
    // Init / Deinit
    //************************************************************
    
    /**
     *  Initialize the card.
     *
     *  - Parameter c_CardSet: The card set this card belongs to.
     */
    
    init(_ c_CardSet: FSCardSet) {
        self.c_CardSet = c_CardSet
        
        do {
            try c_CardSet.LoadCard(&p_Card)
        } catch let error as FSCardSet.FSError {
            FSCommon.Log(error.s_String)
        } catch {}
    }
    
    /**
     *  Deinitialize the card.
     */
    
    deinit {
        if let p_Current = p_Card {
            do {
                try c_CardSet.DestroyCard(p_Card: p_Current, b_Completed: b_Completed)
            } catch let error as FSCardSet.FSError {
                FSCommon.Log(error.s_String)
            } catch {}
        }
    }
    
    //************************************************************
    // Completed
    //************************************************************
    
    /**
     *  Change the card completion status.
     *
     *  Parameter b_Completed: true if the card was completed, false if not.
     */
    
    func Completed(_ b_Completed: Bool) -> Void {
        self.b_Completed = b_Completed
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Check if a card is loaded or not.
     *
     *  - Returns: `true` if the card is loaded, `false` if not.
     */
    
    func GetLoaded() -> Bool {
        return p_Card != nil ? true : false
    }
    
    /**
     *  Get the card type.
     *
     *  - Returns: The card type.
     */
    
    func GetType() -> Int32? {
        guard let p_Current = p_Card else {
            return nil
        }
        
        return FSC_CDGetType(p_Current)
    }
    
    /**
     *  Get a card c string as swift string.
     *
     *  - Parameter e_String: The string to read.
     *
     *  - Returns: The card swift string.
     */
    
    func GetString(_ e_String: FSString) -> String? {
        guard let p_Current = p_Card else {
            return nil
        }
        
        do {
            switch e_String {
                case .Data: return try FSCommon.UTF8ToString(FSC_CDGetData(p_Current))
                case .Question: return try FSCommon.UTF8ToString(FSC_CDGetQuestion(p_Current))
                case .Answer: return try FSCommon.UTF8ToString(FSC_CDGetAnswer(p_Current))
            }
        } catch let error as FSCommon.FSError {
            FSCommon.Log(error.s_String)
            return nil
        } catch {
            return nil
        }
    }
}
