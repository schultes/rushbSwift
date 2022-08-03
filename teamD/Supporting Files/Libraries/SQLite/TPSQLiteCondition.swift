//
//  TPSQLiteCondition.swift
//  templates
//
//  Created by Nicklas Düringer on 05.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
 Represents a condition. It requires 1-3 expressions
- Parameter left: Operand on the left side of the condition
- Parameter center: Operator or entire condition
- Parameter right: Operand on the right side of the condition
*/
class TPSQLiteCondition {
    var left: String = ""
    var center: String = ""
    var right: String = ""
    
    init(left: String, center: String, right: String) {
        self.left = left
        self.center = center
        self.right = right
    }
    
    init(left: String, right: String) {
        self.left = left
        self.right = right
    }
    
    init(center: String) {
        self.center = center
    }
    
    /**
     Returns a string representation of the condition
     - Returns: String
    */
    func toString() -> String {
        return "\(left) \(center) \(right)"
    }
}
