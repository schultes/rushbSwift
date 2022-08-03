//
//  GameModelController.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

protocol GameViewControllerInterface {
    func setMusicAndSound(settings: SettingsModel)
    func setCountDown(countDown: CountDownModel)
    func setHighscore(highscore: HighscoreModel)
}

class GameModelController {
    private let viewControllerInterface: GameViewControllerInterface
    private let conn: TPSQLite?
    init(viewControllerInterface: GameViewControllerInterface, conn: TPSQLite?) {
        self.viewControllerInterface = viewControllerInterface
        self.conn = conn
    }

    func loadSound() {
        conn?.query(data: SettingsModel.self, query: "SELECT * FROM settings;") {
            result, error in
            if let resultObject = result {
                self.viewControllerInterface.setMusicAndSound(settings: resultObject[0])
            }
            if let errorObject = error {
                print("Error: \(errorObject)")
            }
        }
    }

    func loadCountDown() {
        conn?.query(data: CountDownModel.self, query: "SELECT * FROM countdown;") {
            result, error in
            if let resultObject = result {
                self.viewControllerInterface.setCountDown(countDown: resultObject[0])
            }
            if let errorObject = error {
                print("Error: \(errorObject)")
            }
        }
    }

    func updateCountDown(model: CountDownModel) {
        conn?.update(tableName: "countdown", data: model, condition: "id".eq(value: model.id)) {
            if let itObject = $0 {
                print(itObject)
            }
        }
    }

    func getScoreForLevel(level: String) {
        conn?.query(data: HighscoreModel.self, query: "SELECT * FROM highscore WHERE level = ?", selectionArgs: [level]) {
            result, error in
            
            if let resultObject = result {
                self.viewControllerInterface.setHighscore(highscore: resultObject[0])
            }
            
            if let errorObject = error {
                print("Error: \(errorObject)")
            }
        }
    }

    func updateScore(model: HighscoreModel) {
        if let id = model.id {
            conn?.update(tableName: "highscore", data: model, condition: "id".eq(value: id.intValue)) {
                it in
                if let itObject = it {
                    print(itObject)
                }
            }
        }
    }
}
