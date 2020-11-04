//
//  CardViewModel.swift
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
    
    @Published private(set) var b_Loaded = false
    
    private weak var c_Card: FSCard? = nil
    private var c_CheckLoaded: DispatchWorkItem? = nil
    private var s_DirPath: String = ""
    
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
     *  - Parameter c_Card: The card to manage.
     */
    
    func Validate(c_Card: FSCard?, s_DirPath: String) -> Void {
        // Invalidate first, reset the model
        Invalidate()
        
        // Update directory
        self.s_DirPath = s_DirPath
        
        // Can we use the given card?
        if (c_Card == nil) {
            return;
        }
        
        // Load the card in async
        c_CheckLoaded = DispatchWorkItem { [weak self] in
            guard let c_Current = c_Card else {
                return; // nil
            }
            
            while (true) {
                guard let c_Owner = self else {
                    break
                }
                
                if (c_Owner.b_Loaded || c_Owner.c_CheckLoaded!.isCancelled) {
                    break
                }
                
                if (c_Current.GetLoaded()) {
                    c_Owner.c_Card = c_Current
                    c_Owner.SetLoaded(true)
                } else {
                    usleep(useconds_t(16 * 1000)) // * 1000 -> Makes milliseconds
                }
            }
        }
        
        DispatchQueue.main.async(execute: c_CheckLoaded!)
    }
    
    /**
     *  Invalidate the view model, destroying data.
     */
    
    func Invalidate() -> Void {
        if let c_Work = c_CheckLoaded {
            c_Work.cancel()
            c_CheckLoaded = nil
        }
        
        b_Loaded = false
        c_Card = nil
        s_DirPath = ""
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Get the card data type.
     *
     *  - Returns: The card data type.
     */
    
    func GetType() -> Int32 {
        if let c_Current = c_Card {
            return c_Current.GetType() ?? 0
        }
        
        return 0
    }
    
    /**
     *  Get a card string type.
     *
     *  - Parameter e_String: The requested string.
     *
     *  - Returns: The card string.
     */
    
    func GetString(_ e_String: FSCard.FSString) -> String {
        if let c_Current = c_Card {
            if (e_String == .Data) {
                switch (GetType()) {
                    case 1: return s_DirPath + (c_Current.GetString(e_String) ?? "")
                    case 2: return s_DirPath + (c_Current.GetString(e_String) ?? "")
                    
                    default: () // Go to no dir path string
                }
            }
            
            return c_Current.GetString(e_String) ?? ""
        }
        
        return ""
    }
    
    //************************************************************
    // Setters
    //************************************************************
    
    /**
     *  Set the card load state.
     *
     *  - Parameter b_Loaded: The new card load state.
     */
    
    fileprivate func SetLoaded(_ b_Loaded: Bool) -> Void {
        self.b_Loaded = b_Loaded
    }
}
