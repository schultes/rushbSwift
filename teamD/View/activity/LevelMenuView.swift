//
//  LevelMenuView.swift
//  teamD
//
//  Created by FMA1 on 01.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI


struct LevelMenuView: View {
    var viewController = LevelMenuViewController()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var rootIsActive: Bool
    
    var gridColumns: [GridItem] =
             Array(repeating: .init(.fixed(80)), count: 4)

    var body: some View {
        ZStack {
            Image("zach_inglis_5jk6xg_7by4_unsplash_small")
            VStack{
                Text("Rush B")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 200)
                    .padding(8)
                VStack {
                    LazyVGrid(columns: gridColumns) {
                        ForEach((0..<self.viewController.getLevelCount()), id: \.self) {
                            let level = $0+1
                            let difficulty = self.viewController.getLevelDifficulty(index: $0)
                            NavigationLink(destination: GameView(level: level, shouldPopToRootView: self.$rootIsActive)) {
                                LevelButton(text: "\(level)", fontColor: self.getColor(difficulty: difficulty), color: .white)
                            }.isDetailLink(false)
                        }
                    }
                }
                .fixedSize(horizontal: true, vertical: true)
                .padding(.top, 36)
                VStack {
                    Text("Projekt von: Noah Stürtz, Adrian Werner, Silas Buchwald")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 128)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }){
            IconButton(icon: "xmark", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
        })
        
    }
    
    func getColor(difficulty: String) -> Color {
        switch difficulty {
        case "Beginner":
            return Color(UIColor(hex: ColorValue.green))
        case "Intermediate":
            return Color(UIColor(hex: ColorValue.orange))
        case "Advanced":
            return Color(UIColor(hex: ColorValue.blue))
        case "Expert":
            return Color(UIColor(hex: ColorValue.red))
        default:
            return Color(UIColor(hex: ColorValue.green))
        }
    }
}

