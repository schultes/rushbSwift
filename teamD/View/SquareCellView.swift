//
//  SquareCellView.swift
//  teamD
//
//  Created by FMA1 on 05.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct SquareCellView: View {
    var size: CGFloat
    var image: String
    var color: Block.Colors
    var renderGoal: Bool
    var index: Int
    var handleTab: (Int) -> ()
    
    var body: some View {
        ZStack(alignment: .trailing) {
            let col = color == Block.Colors.GREY ? Color.gray : Color.red
            if (image != "") {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .background(col)
            } else {
                Rectangle()
                    .fill(col)
                  
            }
            if (renderGoal) {
                Image("finish")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.60)
            }
        }
        .frame(width: size, height: size)
        .onTapGesture {
            handleTab(index)
        }
    }
}

/*struct SquareCellView_Previews: PreviewProvider {
    static var previews: some View {
        SquareCellView(size: 75, image: "lightgreen_car_front_horizontal", color: Block.Colors.RED, renderGoal: false, index: 1, handleTab: )
    }
}*/
