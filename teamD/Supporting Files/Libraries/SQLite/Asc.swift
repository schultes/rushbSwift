//
//  Asc.swift
//  templates
//
//  Created by Nicklas Düringer on 18.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
 Holds the column for the ORDER BY clause in ascending order
- Parameter col: Name of the column
*/
class Asc: Sort {
    override init(col: String) {
        super.init(col: col)
    }
    
    override func getDirection() -> String {return "ASC"}
}
