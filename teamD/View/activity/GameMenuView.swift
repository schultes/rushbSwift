//
//  GameMenuView.swift
//  teamD
//
//  Created by FMA1 on 01.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct GameMenuView: View {
    @State var isActive = true
    var viewController = GameMenuViewController()
    var body: some View {
        VStack {
            Text("Rush B")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 200)
                .padding(8)
            Text("Durch den Stau von A nach B")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 200)
                .multilineTextAlignment(.center)
            VStack(spacing: 12) {
                NavigationLink(destination: LevelMenuView(rootIsActive: self.$isActive)) {
                    MenuButton(text: "LEVELS", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
                }.isDetailLink(true)
                NavigationLink(destination: GameView(level: 0, shouldPopToRootView: $isActive)) {
                    MenuButton(text: "TIME BREAKER", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
                }.isDetailLink(true)
                NavigationLink(destination: SettingsMenuView()) {
                    MenuButton(text: "EINSTELLUNGEN", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
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
}

struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
