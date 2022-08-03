//
//  LevelButton.swift
//  teamD
//
//  Created by FMA1 on 09.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct LevelButton: View {
    let text: String
    let fontColor: Color
    let color: Color
    var body: some View {
        Text(text)
        .fontWeight(.bold)
        .foregroundColor(fontColor)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
        .background(color)
        .cornerRadius(4)
    }
}

struct LevelButton_Previews: PreviewProvider {
    static var previews: some View {
        LevelButton(text: "1", fontColor: .white , color: Color(UIColor(hex: ColorValue.orange)))
    }
}
