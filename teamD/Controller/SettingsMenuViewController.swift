//
//  SettingsMenuViewController.swift
//  teamD
//
//  Created by FMA1 on 31.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation

class SettingsMenuViewController: ObservableObject, SettingsMenuViewControllerInterface {
    
    var modelController: SettingsMenuModelController? = nil
    @Published var settings = SettingsModel()
    
    init() {
        modelController = SettingsMenuModelController(viewController: self, conn: DB.conn)
        if let modelController = modelController {
            modelController.getInitialSettings()
        }
    }
    
    func setInitialSettings(settings: SettingsModel) {
        self.settings = settings
    }
    
    func onMusicSwitch() {
        settings.music = !settings.music
        if let modelController = modelController {
            modelController.changeSettings(settings: settings)
        }
    }
    
    func onSoundSwitch() {
        settings.sound = !settings.sound
        if let modelController = modelController {
            modelController.changeSettings(settings: settings)
        }
    }
    
    func onHighscoreReset() {
        if let modelController = modelController {
            modelController.resetHighscore()
        }
    }
}
