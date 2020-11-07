//
//  VMCard.swift
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


final class FSCardViewModel: ObservableObject {
    
    //************************************************************
    // Variables
    //************************************************************
    
    @Published private(set) var b_Loaded: Bool = false
    @Published var b_LoadFailed = false
    
    private var c_Card: FSCard? = nil
    private var s_DirPath: String = ""
    private(set) var f_Answered: ((Bool) -> ())? = nil
    
    var s32_Type: Int32 {
        return c_Card?.s32_Type ?? -1
    }
    var s_Data: String {
        let s_String = c_Card?.s_Data ?? "" // The card path is relative to the context path
        return s32_Type > FSC_CDTYPE_TEXT.rawValue ? s_DirPath + s_String : s_String
    }
    var s_Question: String {
        return c_Card?.s_Question ?? ""
    }
    var s_Answer: String {
        return c_Card?.s_Answer ?? ""
    }

    //************************************************************
    // Deinit
    //************************************************************
    
    /**
     *  Deinitialize the card view model.
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
     *  - Parameter c_Set: The card set for the card.
     *  - Parameter f_Answered: The callback for a given answer.
     */
    
    func Validate(c_Card: FSCard?, s_DirPath: String, f_Answered: @escaping ((Bool) -> ())) -> Void {
        // Invalidate first, reset the view model
        Invalidate()
        
        // Update
        self.c_Card = c_Card
        self.s_DirPath = s_DirPath
        self.f_Answered = f_Answered
        
        // Wait for card load
        // @TODO: Implement block, react to didSet, etc.
        //        This works and is fast, but it WILL affect
        //        battery.
        DispatchQueue.global().async {
            if let c_Current = self.c_Card {
                let i_EndTime = time(nil) + 10 // the native swift method is incredibly stupid
                
                // Load check is async, once the load check
                // is positive we update on the main thread
                while (!c_Current.b_Loaded) {
                    // Cancel condition, took to long
                    if (time(nil) >= i_EndTime) {
                        DispatchQueue.main.async {
                            self.b_LoadFailed = true
                        }
                        return
                    }
                }
                
                // Card was loaded
                DispatchQueue.main.async {
                    self.b_Loaded = true
                }
            }
        }
    }
    
    /**
     *  Invalidate the view model, destroying data.
     */
    
    func Invalidate() -> Void {
        b_Loaded = false
        b_LoadFailed = false
        c_Card = nil
        f_Answered = nil
        s_DirPath = ""
    }
}
