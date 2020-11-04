//
//  CardView.swift
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


struct FSCardView: View {
    
    //************************************************************
    // Types
    //************************************************************
    
    private enum FSState {
        case Appear
        case Idle
        case Flipped
        case Disappear
    }
    
    //************************************************************
    // Variables
    //************************************************************
    
    @EnvironmentObject var c_Settings: FSSettingsViewModel
    
    @ObservedObject private var c_Model = FSCardViewModel()
    
    @State private var e_State: FSState = .Appear
    @State private var c_Offset: CGSize = CGSize(width: UIScreen.main.bounds.width,
                                                 height: 0)
    
    private let f_Answered: ((Bool) -> ())
    
    //************************************************************
    // Answer Body
    //************************************************************
    
    var v_Answer: some View {
        VStack {
            Text(c_Model.GetString(.Answer))
                .font(.title2)
                .foregroundColor(Color("CardTitleTextColor"))
                .minimumScaleFactor(0.01)
                .padding()
        }
    }
    
    //************************************************************
    // Question Body
    //************************************************************
    
    var v_Question: some View {
        VStack {
            if (c_Model.GetType() != 0) { // @TODO: Compiler segfault for C enum <.<
                if (FSCommon.FileExists(c_Model.GetString(.Data))) {
                    switch (c_Model.GetType()) {
                        case 1:
                            Image(uiImage: UIImage(contentsOfFile: c_Model.GetString(.Data))!)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: 2, y: 4)
                        /*
                        case 2:
                            Text(c_Model.GetString(Data)) // @TODO: Sound from Model
                        */
                        
                        // Unknown type, show the path
                        default:
                            Text("@ASSET_UNKNOWN", tableName: "ActiveSet")
                                .font(.title)
                                .foregroundColor(.gray)
                                .minimumScaleFactor(0.01)
                                .padding()
                    }
                } else {
                    Text("@ASSET_MISSING", tableName: "ActiveSet")
                        .font(.title)
                        .foregroundColor(.gray)
                        .minimumScaleFactor(0.01)
                        .padding()
                }
            } else {
                Text(c_Model.GetString(.Data))
                    .font(.title)
                    .foregroundColor(Color("CardTitleTextColor"))
                    .minimumScaleFactor(0.01)
                    .padding()
            }
            
            Text(c_Model.GetString(.Question))
                .font(.title2)
                .foregroundColor(Color("CardTitleTextColor"))
                .minimumScaleFactor(0.01)
                .padding()
        }
    }
    
    //************************************************************
    // Main Body
    //************************************************************
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("CardColor"))
                    .cornerRadius(20)
                    .shadow(radius: 10, y: 10)
                
                // NOTE: We flip the card and text both, so that the text always appears
                //       correctly.
                if (self.c_Model.b_Loaded) {
                    v_Question
                        .multilineTextAlignment(.center)
                        .padding()
                        .rotation3DEffect(.degrees(self.GetFlipped() ? 0.0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .opacity(self.GetFlipped() ? 0 : 1)
                    
                    v_Answer
                        .multilineTextAlignment(.center)
                        .padding()
                        .rotation3DEffect(.degrees(self.GetFlipped() ? 0.0 : 180.0), axis: (x: 0.0, y: -1.0, z: 0.0))
                        .opacity(self.GetFlipped() ? 1 : 0)
                } else {
                    ProgressView()
                        .padding()
                        .rotation3DEffect(.degrees(self.GetFlipped() ? 0.0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                }
            }
        }
        .rotation3DEffect(.degrees(self.GetFlipped() ? 0.0 : 180.0), axis: (x: 0.0, y: -1.0, z: 0.0))
        .offset(x: c_Offset.width)
        .onTapGesture(perform: self.FlipCard)
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
            .onChanged { gesture in
                self.c_Offset = gesture.translation // Always allow, helps avoid recentering issues
            }
            .onEnded { _ in
                self.CardDisappear()
            }
        )
        .onReceive(self.c_Model.objectWillChange, perform: { _ in
            self.CardAppear()
        })
        .onDisappear {
            self.c_Model.Invalidate()
        }
        .padding([.leading, .trailing], 30)
        .padding([.top, .bottom], 60)
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the card view.
     *
     *  - Parameter c_Card: The card to show.
     *  - Parameter f_Asnwered: The callback to use once an answer was given.
     */
    
    init(c_Card: FSCard?, s_DirPath: String, f_Answered: @escaping ((Bool) -> ())) {
        self.f_Answered = f_Answered
        
        self.c_Model.Validate(c_Card: c_Card, s_DirPath: s_DirPath)
        CardAppear()
    }
    
    //************************************************************
    // State
    //************************************************************
    
    /**
     *  Scale the card into existence.
     */
    
    private func CardAppear() -> Void {
        withAnimation(.spring()) {
            c_Offset = .zero // Reset from move
            
            switch (e_State) {
                case .Appear: e_State = .Idle
                case .Disappear: e_State = .Idle
                    
                default: ()
            }
        }
    }
    
    /**
     *  Flip the card.
     */
    
    private func FlipCard() -> Void {
        withAnimation/* rotation3DEffect */ {
            switch (e_State) {
                case .Idle: e_State = .Flipped
                case .Flipped: e_State = .Idle
                
                default: ()
            }
        }
    }
    
    /**
     *  Make the card disappear.
     */
    
    private func CardDisappear() -> Void {
        withAnimation(.spring()) {
            if (e_State != FSState.Flipped || (c_Offset.width > (-100) && c_Offset.width < 100)) {
                c_Offset = .zero
                return
            }

            c_Offset.width = c_Offset.width > 0 ? UIScreen.main.bounds.width : -(UIScreen.main.bounds.width)
            e_State = FSState.Disappear
            f_Answered(c_Offset.width > 0 ? c_Settings.b_CDSwipeRightCorrect : !c_Settings.b_CDSwipeRightCorrect)
            c_Model.Invalidate() // Specifically invalidate, return before new construction
        }
    }
    
    //************************************************************
    // Getters
    //************************************************************
    
    /**
     *  Check if the card is currently flipped or not.
     *
     *  - Returns: `true` if flipped, `false` if not.
     */
    
    private func GetFlipped() -> Bool {
        switch (e_State) {
            case .Appear: return false
            case .Idle: return false
            case .Flipped: return true
            case .Disappear: return true
        }
    }
}
