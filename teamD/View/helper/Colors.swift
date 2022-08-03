//
//  Colors.swift
//  teamD
//
//  Created by Nicklas Düringer on 03.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation
import SwiftUI

class ColorValue {
    
    static let purple = "#FFBB86FC"
    static let purple_500 = "#FF6200EE"
    static let purple_700 = "#FF3700B3"
    static let teal_200 = "#FF03DAC5"
    static let teal_700 = "#FF018786"
    static let lightgreen = "#32CD32"
    static let green = "#228B22"
    static let orange = "#F37C22"
    static let yellow = "#FFFF00"
    static let red = "#B22222"
    static let lightblue = "#87CEEB"
    static let blue = "#0000FF"
    static let cell_background = "#FFFFFFFF"
}

extension UIColor {
    public convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            var r: CGFloat = 0.0
            var g: CGFloat = 0.0
            var b: CGFloat = 0.0
            var a: CGFloat = 1.0
            
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            
            if ((cString.count) == 8) {
                r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
                g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
                b = CGFloat((rgbValue & 0x0000FF)) / 255.0
                a = CGFloat((rgbValue & 0xFF000000)  >> 24) / 255.0
            } else if ((cString.count) == 6){
                r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
                g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
                b = CGFloat((rgbValue & 0x0000FF)) / 255.0
                a =  CGFloat(1.0)
            }
            
            self.init(  red: r,
                        green: g,
                        blue: b,
                        alpha: a
            )
    }
}
