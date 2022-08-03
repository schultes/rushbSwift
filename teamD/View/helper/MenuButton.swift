//
//  MenuButton.swift
//  teamD
//
//  Created by Nicklas Düringer on 03.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    let text: String
    let fontColor: Color
    let color: Color
    var body: some View {
        Text(text)
        .fontWeight(.bold)
        .foregroundColor(fontColor)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(4)
        
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(text: "HILFE", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
    }
}

