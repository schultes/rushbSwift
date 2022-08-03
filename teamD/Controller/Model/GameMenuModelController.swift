//
//  GameMenuModelController.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation

protocol GameMenuViewControllerInterface {
    func getLevel() -> String
}

class GameMenuModelController {
    private let viewControllerInterface: GameMenuViewControllerInterface
    private let conn: TPSQLite?
    
    init(viewControllerInterface: GameMenuViewControllerInterface, conn: TPSQLite?) {
        self.viewControllerInterface = viewControllerInterface
        self.conn = conn
    }

    func setInitialSettings() {
        conn?.dropTable(tableName: "settings") {_ in
            print("removed table settings")
        }

        let tableSettings = TPSQLiteTable(name: "settings", columns: [TPSQLiteColumn(name: "id", dataType: TPSQLiteDataType.Integer).PrimaryKey(), TPSQLiteColumn(name: "sound", dataType: TPSQLiteDataType.Integer), TPSQLiteColumn(name: "music", dataType: TPSQLiteDataType.Integer)])
        conn?.createTable(table: tableSettings) {
            connObject in
            print(connObject)
        }

        conn?.insert(tableName: "settings", data: SettingsModel()) {_ in
            print("inserted")
        }
    }

    func setInitialCountDown() {
        conn?.dropTable(tableName: "countdown") {_ in
            print("removed table countdown")
        }

        let tableCountDown = TPSQLiteTable(name: "countdown", columns: [TPSQLiteColumn(name: "id", dataType: TPSQLiteDataType.Integer).PrimaryKey(), TPSQLiteColumn(name: "seconds", dataType: TPSQLiteDataType.Integer)])
        conn?.createTable(table: tableCountDown) {
            connObject in
            print(connObject)
        }

        conn?.insert(tableName: "countdown", data: CountDownModel()) {_ in
            print("inserted")
        }
    }

    func setInitialHighscore() {
        conn?.dropTable(tableName: "highscore") {_ in
            print("removed table highscore")
        }

        let tableHighscore = TPSQLiteTable(name: "highscore", columns: [TPSQLiteColumn(name: "id", dataType: TPSQLiteDataType.Integer).PrimaryKey(), TPSQLiteColumn(name: "level", dataType: TPSQLiteDataType.Text), TPSQLiteColumn(name: "score", dataType: TPSQLiteDataType.Integer)])
        conn?.createTable(table: tableHighscore) {
            connObject in
            print(connObject)
        }

        let jsonString = viewControllerInterface.getLevel()
        let jsonObject = TPJSONObject(string: jsonString)
        let jsonArray = jsonObject.getJSONArray(key: "levels")!
        for i in 0..<jsonArray.length() + 1 {
            let highscoreModel = HighscoreModel()
            highscoreModel.id = i as NSNumber
            if i == 0 {
                highscoreModel.level = "timeBreaker"
            } else {
                highscoreModel.level = "level_\(i)"
            }

            conn?.insert(tableName: "highscore", data: highscoreModel) {_ in
                print("inserted")
            }
        }
    }
}
