//
//  HighscoreModel.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//
import Foundation

class HighscoreModel: TPSQLiteEntity {
    @objc var id: NSNumber? = nil
    @objc var level: String = ""
    @objc var score: Int = 0
}
