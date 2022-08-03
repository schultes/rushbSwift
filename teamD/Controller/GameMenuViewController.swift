//
//  GameMenuViewController.swift
//  teamD
//
//  Created by FMA1 on 31.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation

class GameMenuViewController: GameMenuViewControllerInterface {
   
    private var modelController: GameMenuModelController? = nil

    
    init() {
        let preferences = UserDefaults.standard
        if DB.conn != nil {
            modelController = GameMenuModelController(viewControllerInterface: self, conn: DB.conn)
        } else {
            DB().createConn()
            modelController = GameMenuModelController(viewControllerInterface: self, conn: DB.conn)
            if preferences.object(forKey: "firstStart") != nil {
                print("It's not the first start")
            } else {
                print("It's the first start")
                preferences.set(true, forKey:"firstStart")
                preferences.synchronize()
                if let modelController = modelController {
                    modelController.setInitialCountDown()
                    modelController.setInitialHighscore()
                    modelController.setInitialSettings()
                }
            }
        }
    }
    
    func getLevel() -> String {
        return JSONLoader.init().readProjectFileAsString(forName: "levels")!
        
    }
}
