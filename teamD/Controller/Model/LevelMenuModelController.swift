//
//  LevelMenuModelController.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

protocol LevelMenuViewControllerInterface {}

class LevelMenuModelController {
    private let viewControllerInterface: LevelMenuViewControllerInterface
    init(viewControllerInterface: LevelMenuViewControllerInterface) {
        self.viewControllerInterface = viewControllerInterface
    }

    static var levels: TPJSONArray = TPJSONArray()
    func setLevels(jsonString: String) {
        let obj = TPJSONObject(string: jsonString)
        // fetch JSONArray named levels
        LevelMenuModelController.levels = obj.getJSONArray(key: "levels")!
    }

    func getLevelCount() -> Int {
        return LevelMenuModelController.levels.length()
    }

    func getLevelDifficulty(index: Int) -> String? {
        let levelObject = LevelMenuModelController.levels.getJSONObject(index: index)
        return levelObject?.getString(key: "difficulty")
    }
}
