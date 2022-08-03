//
//  IconButton.swift
//  teamD
//
//  Created by FMA1 on 05.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct IconButton: View {
    let icon: String
    let fontColor: Color
    let color: Color
    var body: some View {
        Image(systemName: icon)
            .foregroundColor(fontColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(width: 45, height: 45)
            .background(color)
            .cornerRadius(4)
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(icon: "HILFE", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
    }
}
