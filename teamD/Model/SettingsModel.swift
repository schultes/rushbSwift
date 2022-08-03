//
//  SettingsModel.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//
import Foundation

class SettingsModel: TPSQLiteEntity {
    @objc var id: Int = 1
    @objc var sound: Bool = true
    @objc var music: Bool = true
}
