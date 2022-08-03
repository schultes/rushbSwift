//
//  SettingsMenuModelController.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

protocol SettingsMenuViewControllerInterface {
    func setInitialSettings(settings: SettingsModel)
}

class SettingsMenuModelController {
    private let viewController: SettingsMenuViewControllerInterface
    private let conn: TPSQLite?
    
    init(viewController: SettingsMenuViewControllerInterface, conn: TPSQLite?) {
        self.viewController = viewController
        self.conn = conn
    }

    func getInitialSettings() {
        conn?.query(data: SettingsModel.self, query: "SELECT * FROM settings;") {
            result, error in
            
            if let resultObject = result {
                self.viewController.setInitialSettings(settings: resultObject[0])
            }
            
            if let errorObject = error {
                print("Error: \(errorObject)")
            }
        }
    }

    func changeSettings(settings: SettingsModel) {
        conn?.update(tableName: "settings", data: settings, condition: "id".eq(value: 1)) {
            if let itObject = $0 {
                print(itObject)
            }
        }
    }

    func resetHighscore() {
        conn?.query(data: HighscoreModel.self, query: "UPDATE highscore SET score = 0") {
            _, error in
            if let errorObject = error {
                print("Error: \(errorObject)")
            }
        }
    }
}
