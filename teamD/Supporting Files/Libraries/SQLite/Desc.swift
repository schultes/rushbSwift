//
//  Desc.swift
//  templates
//
//  Created by Nicklas Düringer on 18.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
 Holds the column for the ORDER BY clause in descending order
- Parameter col: Name of the column
*/
class Desc: Sort {
    override init(col: String) {
        super.init(col: col)
    }
    
    override func getDirection() -> String {return "DESC"}
}
