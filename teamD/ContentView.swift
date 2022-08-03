//
//  ContentView.swift
//  teamD
//
//  Created by FMA1 on 28.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("zach_inglis_5jk6xg_7by4_unsplash_small")
                GameMenuView()
            }
            .navigationBarItems(trailing: NavigationLink(destination: HelpContentView()) {
                MenuButton(text: "HILFE", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
            })
        }
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
