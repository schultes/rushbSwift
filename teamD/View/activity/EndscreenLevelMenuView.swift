//
//  EndscreenLevelMenuView.swift
//  teamD
//
//  Created by FMA1 on 13.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct EndscreenLevelMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var shouldPopToRootView: Bool
    
    var count : Int
    var level: Int
    var maxLevels: Int
    	
    var body: some View {
        ZStack {
            Image("zach_inglis_5jk6xg_7by4_unsplash_small")
            VStack {
                Text("Rush B")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 200)
                    .padding(8)
                VStack(spacing: 8) {
                    Text(level > 0 ? "Level geschafft!":"Zeit abgelaufen!")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(.top, 35)
                    Text(level > 0 ? "Du hast \(count) Züge dafür benötigt!": "Du hast \(count) Level in der Zeit geschafft!")
                        .foregroundColor(.white)
                    if level == 0 {
                        NavigationLink(destination: GameView(level: 0, shouldPopToRootView: $shouldPopToRootView)) {
                            MenuButton(text: "Neustart", fontColor: Color.black, color: .white)
                                .frame(minWidth: 0, maxWidth: 200)
                                .padding(.bottom, 35)
                        }.isDetailLink(false)
                    }
                    else if level + 1 < maxLevels - 1 {
                        NavigationLink(destination: GameView(level: level + 1, shouldPopToRootView: $shouldPopToRootView)) {
                            MenuButton(text: "Nächstes Level", fontColor: Color.black, color: .white)
                                .frame(minWidth: 0, maxWidth: 200)
                                .padding(.bottom, 35)
                        }.isDetailLink(false)
                    } else {
                        EmptyView()
                            .padding(.bottom, 35)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(UIColor(hex: ColorValue.orange)))
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
        .navigationBarItems(leading:
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                self.shouldPopToRootView = false
            }){
            MenuButton(text: "ZURÜCK", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
            }, trailing: EmptyView()
        )
    }
}

/*struct EndscreenLevelMenuView_Previews: PreviewProvider {
    static var previews: some View {
 EndscreenLevelMenuView(count: <#Int#>)
    }
}*/
