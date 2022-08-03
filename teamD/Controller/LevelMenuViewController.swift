//
//  LevelMenuViewController.swift
//  teamD
//
//  Created by FMA1 on 31.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation
import SwiftUI

class LevelMenuViewController: LevelMenuViewControllerInterface {
    
    var modelController: LevelMenuModelController? = nil
    
    init() {
        modelController = LevelMenuModelController(viewControllerInterface: self);
        
        let jsonString = JSONLoader.init().readProjectFileAsString(forName: "levels")!;
        
        if let modelController = modelController {
            modelController.setLevels(jsonString: jsonString);
        }
    }
    
    func getLevelCount() -> Int {
        return modelController?.getLevelCount() ?? 0
    }
    
    func getLevelDifficulty(index: Int) -> String {
        return modelController?.getLevelDifficulty(index: index) ?? "Beginner"
    }
}

