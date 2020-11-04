//
//  ActiveSetView.swift
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


struct FSActiveSetView: View {
    
    //************************************************************
    // Variables
    //************************************************************
    
    // Change layout depending on mode
    enum Mode {
        case Practice
        case Read
    }
    
    @ObservedObject private var c_Model = FSActiveSetViewModel()
    
    private let s_Title: String
    private let e_Mode: Mode
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        HStack { // Force bg gradient on whole screen for every view (and center views)
            Spacer()
            
            if (c_Model.GetTotalCount() == 0) { // Set files could be edited before importing
                FSSetCardsInfoView(s_Image: "NoCards",
                                   s_Text: NSLocalizedString("@NO_CARDS", tableName: "ActiveSet", comment: "No cards info"))
            } else if (c_Model.GetRemainingCount() == 0) {
                FSSetCardsInfoView(s_Image: "SetCompleted",
                                   s_Text: NSLocalizedString("@CARDS_COMPLETE", tableName: "ActiveSet", comment: "Set completed info"))
            } else if (self.c_Model.c_Card != nil) {
                FSCardView(c_Card: self.c_Model.c_Card,
                           s_DirPath: self.c_Model.GetDirPath(),
                           f_Answered: { b_Result in
                                if let c_Current = self.c_Model.c_Card {
                                    // Set completion on current, decides reuse when returning
                                    c_Current.Completed(self.e_Mode == .Practice ? b_Result : true)
                            }
                            c_Model.NextCard()
                })
            } else {
                EmptyView() // Push spacers to edge for bg color
            }
            
            Spacer()
        }
        .onDisappear {
            self.c_Model.Invalidate()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("CardGradientColorTop"),
                                                               Color("CardGradientColorBottom")]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle(Text(s_Title))
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the card set view.
     *
     *  - Parameter c_Set: The card set to show cards for.
     *  - Parameter s_Title: The title of the card set to show.
     *  - Parameter e_Mode: The card set view mode.
     */
    
    init(c_Set: FSCardSet, s_Title: String, e_Mode: Mode) {
        self.s_Title = s_Title
        self.e_Mode = e_Mode
        
        c_Model.Validate(c_Set)
        c_Model.NextCard() // Load the initial card
    }
}
