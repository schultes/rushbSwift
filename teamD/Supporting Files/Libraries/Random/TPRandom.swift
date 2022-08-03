//
//  TPRandom.swift
//  PluginsForIOSLibrary
//
//  Created by Nicklas Düringer on 13.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation

public class TPRandom {
    
    static func int(from: Int, to: Int) -> Int {
        return Int.random(in: from..<to)
    }
    
    static func double(from: Double, to: Double) -> Double {
        return Double.random(in: from..<to)
    }
    
    static func boolean() -> Bool {
        return Bool.random()
    }
}
