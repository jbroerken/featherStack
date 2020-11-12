//
//  VCard.swift
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
    
    @ObservedObject private var c_Model: FSCardViewModel = FSCardViewModel()
    
    // NOTE: These need to be here, swiftui goes crazy otherwise
    @State private var e_State: FSState = .Appear
    @State private var c_Offset: CGSize = .zero
    @State private var b_ShowTutorial = false
    
    private let FSC_Image: Int32 = FSC_CDTYPE_IMAGE.rawValue // NOTE: Segfault 11 for C Enum <.<
    
    //************************************************************
    // Answer Body
    //************************************************************
    
    var v_Answer: some View {
        VStack {
            Text(self.c_Model.s_Answer)
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
            if (self.c_Model.s32_Type > FSC_CDTYPE_TEXT.rawValue) {
                if (FSCommon.FileExists(self.c_Model.s_Data)) {
                    switch (self.c_Model.s32_Type) {
                        case FSC_Image:
                            Image(uiImage: UIImage(contentsOfFile: self.c_Model.s_Data)!)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 3, y: 4)
                        /*
                        case 2:
                            Text(c_Model.s_Data) // @TODO: Sound from Model
                        */
                        
                        // Unknown type, show the path
                        default:
                            Text("@ASSET_UNKNOWN", tableName: "SActiveSet")
                                .font(.title)
                                .foregroundColor(.gray)
                                .minimumScaleFactor(0.01)
                                .padding()
                    }
                } else {
                    Text("@ASSET_MISSING", tableName: "SActiveSet")
                        .font(.title)
                        .foregroundColor(.gray)
                        .minimumScaleFactor(0.01)
                        .padding()
                }
            } else {
                Text(self.c_Model.s_Data)
                    .font(.system(size: 48))
                    .bold()
                    .lineLimit(1)
                    .foregroundColor(Color("CardTitleTextColor"))
                    .minimumScaleFactor(0.01)
                    .padding()
            }
            
            // Always show the question
            Text(self.c_Model.s_Question)
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
                        // No rotation, tap disabled
                }
            }
        }
        .rotation3DEffect(.degrees(self.GetFlipped() ? 0.0 : 180.0), axis: (x: 0.0, y: -1.0, z: 0.0))
        .offset(x: self.c_Offset.width)
        .onTapGesture {
            self.FlipCard()
        }
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
            .onChanged { gesture in
                self.c_Offset = gesture.translation // Always allow, helps avoid recentering issues
            }
            .onEnded { _ in
                self.CardDisappear()
            }
        )
        .onAppear {
            self.ShowTutorial()
        }
        .onReceive(c_Model.objectWillChange, perform: { _ in
            self.CardAppear()
        })
        .onDisappear {
            self.c_Model.Invalidate()
        }
        .padding([.leading, .trailing], 30)
        .padding([.top, .bottom], 60)
        .sheet(isPresented: self.$b_ShowTutorial) { // Usage tutorial
            FSCardTutorialView()
        }
        .alert(isPresented: self.$c_Model.b_LoadFailed) { // Alert user on load fail
            Alert(title: Text("@ALERT_TITLE", tableName: "SActiveSet"),
                  message: Text("@ALERT_MESSAGE", tableName: "SActiveSet"),
                  dismissButton: .default(Text("@ALERT_DISMISS", tableName: "SActiveSet")))
        }
    }
    
    //************************************************************
    // Init
    //************************************************************
    
    /**
     *  Initialize the card view.
     *
     *  - Parameter c_Card: The card to display.
     *  - Parameter s_DirPath: The path to the card set directory.
     *  - Parameter f_Asnwered: The callback to use once an answer was given.
     */
    
    init(c_Card: FSCard?, s_DirPath: String, f_Answered: @escaping ((Bool) -> ())) {
        c_Model.Validate(c_Card: c_Card, s_DirPath: s_DirPath, f_Answered: f_Answered)
        
        if (c_Model.b_Loaded) {
            CardAppear()
        }
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
        if (!c_Model.b_Loaded) {
            return
        }
        
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
            
            if let f_Callback = c_Model.f_Answered {
                f_Callback(c_Offset.width > 0 ? c_Settings.b_CDSwipeRightCorrect : !c_Settings.b_CDSwipeRightCorrect)
            }
            
            c_Model.Invalidate() // Specifically invalidate, return before new construction
        }
    }
    
    //************************************************************
    // Tutorial
    //************************************************************
    
    /**
     *  Show the card tutorial.
     */
    
    private func ShowTutorial() -> Void {
        if (self.c_Settings.b_TShowCard) {
            self.b_ShowTutorial.toggle() // Trigger refresh
            self.c_Settings.b_TShowCard = false // Shown, do not show again
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
