//
//  GameViewController.swift
//  teamD
//
//  Created by FMA1 on 31.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation
import AVFoundation

class GameViewController: ObservableObject, GameViewControllerInterface {
    
    private var modelController: GameModelController? = nil

    @Published var grid = Grid()
    var count: Int = 0
    var w: Int = 6
    private var h: Int = 6
    
    var level: Int = 0

    private var currentLevel : String = ""
    var timeBreakerLevel = 0

    var backgroundPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    
    
    var countDownModel = CountDownModel()
    var settingsModel = SettingsModel()
    var highscoreModel = HighscoreModel()
    
    @Published var cells = [Cell]()
    @Published var isFinished = false
    @Published var timeLeft = 0
    
    init() {
        modelController = GameModelController(viewControllerInterface: self, conn: DB.conn)
    }
    
    func loadLevel(level: Int) {
        self.level = level
        initGrid()
        if level == 0 {
            modelController?.getScoreForLevel(level: "timeBreaker")
        } else {
            modelController?.getScoreForLevel(level: "level_\(level)")
        }
    }
    
    func resetLevel() {
        initGrid()
    }
    
    func resetTimeBreaker() {
        timeBreakerLevel = 0
        timeLeft = 90
    }
    
    private func initGrid() {
        let json = JSONLoader().readProjectFileAsString(forName: "levels")
        grid = Grid()
        grid.generate(width: w, height: h, json: json!, level: level)
        cells = convert(grid: grid)
    }
    
    private func convert(grid: Grid) -> [Cell] {
        var cells = [Cell]()
        var index: Int = 0
        for i in 0..<grid.width {
            for j in 0..<grid.height {
                let position = Position(x: j, y: i)
                let block = grid.blockList.first {
                    $0.contains(p: position)
                }

                var offset: Int = -1
                if block != nil {
                    switch block!.orientation {
                        case Block.Orientations.HORIZONTAL:
                            offset = position.x - (block?.start.x)!
                        case Block.Orientations.VERTICAL:
                            offset = position.y - (block?.start.y)!
                    }
                }
                cells.append(Cell(id: index, position: position, block: block, offset: offset))
                index += 1
            }
        }
        return cells
    }
    
    public func getImage(cellIndex: Int) -> String {
        return getImage(cell: cells[cellIndex])
    }
    
    public func getImage(cell: Cell) -> String {
        var result = ""
    
        if let block = cell.block {
            if(block.length == 2) {
                if (block.start.equals(other: cell.position) == true) {
                    if(block.orientation == Block.Orientations.HORIZONTAL){
                        result = block.type! + "_back_horizontal"// ?? "white_car_back_horizontal"
                    } else {
                        result = block.type! + "_front_vertical"// ?? "white_car_front_vertical"
                    }
                } else if(block.end.equals(other: cell.position) == true) {
                    if (block.orientation == Block.Orientations.HORIZONTAL) {
                        result = block.type! + "_front_horizontal"// ?? "white_car_front_horizontal"
                    } else {
                        result = block.type! + "_back_vertical" //?? "white_car_back_vertical"
                    }
                }
            } else if(block.length == 3) {
                if (block.start.equals(other: cell.position) == true) {
                    if (block.orientation == Block.Orientations.HORIZONTAL) {
                        result = block.type! + "_back_horizontal"// ?? "white_truck_back_horizontal"
                    } else {
                        result = block.type! + "_front_vertical"// ?? "white_truck_front_vertical"
                    }
                } else if (block.end.equals(other: cell.position) == true) {
                    if (block.orientation == Block.Orientations.HORIZONTAL) {
                        result = block.type! + "_front_horizontal"// ?? "white_truck_front_horizontal"
                    } else {
                        result = block.type! + "_back_vertical"// ?? "white_truck_back_vertical"
                    }
                } else {
                    if (block.orientation == Block.Orientations.HORIZONTAL) {
                        result = block.type! + "_middle_horizontal"// ?? "white_truck_middle_horizontal"
                    } else {
                        result = block.type! + "_middle_vertical"// ?? "white_truck_middle_vertical"
                    }
                }
            }
        }
        return result
    }
    
    public func handleTab(cellIndex: Int) {
        let cell = cells[cellIndex]
        if let block = cell.block {
            if block.orientation == Block.Orientations.HORIZONTAL {
                if cell.position.x == block.start.x {
                    if grid.move(block: block, direction: false) { count += 1 }
                } else if cell.position.x == block.end.x {
                    if grid.move(block: block, direction: true) {
                        
                        count += 1
                    } else {
                        count += 1
                        if block.end.x == w-1 && block.isStart && !grid.move(block: block, direction: true) {
                            finished()
                        }
                    }
                }
            } else if block.orientation == Block.Orientations.VERTICAL {
                if cell.position.y == block.start.y {
                    if grid.move(block: block, direction: false) { count += 1 }
                } else if cell.position.y == block.end.y {
                    if (grid.move(block: block, direction: true)) { count += 1 }
                }
            }
            
            if count > 0 {
                if block.isStart {
                    block.color = Block.Colors.GREY
                }
            }
        }
        cells = convert(grid: grid)
    }

    func playSoundEffect() {
        if settingsModel.sound {
            let soundArray = [Sound(name: "honk", format: "mp3"), Sound(name: "double_honk", format: "wav"), Sound(name: "car_engine", format: "wav"), Sound(name: "car_crash", format: "wav"), Sound(name: "car_tires", format: "mp3")]
            let randomNumber = TPRandom.int(from: 0, to: soundArray.count)
            guard let url = Bundle.main.url(forResource: soundArray[randomNumber].name, withExtension: soundArray[randomNumber].format) else { return }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                    soundEffectPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                    /* iOS 10 and earlier require the following line:
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                    guard let player = soundEffectPlayer else { return }

                    player.volume = 0.1
                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }

        func playMusic(){
			/* DEACTIVATED due to copyright reasons
            guard let url = Bundle.main.url(forResource: "puzzle_music", withExtension: "mp3") else { return }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    // The following line is required for the player to work on iOS 11. Change the file type accordingly
                    backgroundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                    // iOS 10 and earlier require the following line:
                    //player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) 

                    guard let player = backgroundPlayer else { return }
                    player.numberOfLoops = -1
                    player.volume = 0.1
                    player.play()
                    
                } catch let error {
                    print(error.localizedDescription)
                }
			*/
        }

        func stopSoundEffectPlayer(){
            soundEffectPlayer?.stop()
            soundEffectPlayer = nil
        }

        func stopMusicPlayer(){
            backgroundPlayer?.stop()
            backgroundPlayer = nil
        }

        func loadAndPlaySound(){
            if let modelController = modelController {
                modelController.loadSound()
                if settingsModel.music {
                    playMusic()
                }
            }
        }
    
    func setMusicAndSound(settings: SettingsModel) {
        self.settingsModel = settings
    }
    
    func setCountDown(countDown: CountDownModel) {
        self.countDownModel = countDown
    }
    
    func setHighscore(highscore: HighscoreModel) {
        self.highscoreModel = highscore
    }

    func finished () {
        // level mode
        if level > 0 {
            if highscoreModel.score == 0 || count <= highscoreModel.score {
                highscoreModel.score = count
                modelController?.updateScore(model: highscoreModel)
            }
            // open end screen level menu view
            isFinished = true
        // timebreaker mode
        } else {
            if timeLeft > 0 {
                timeBreakerLevel += 1
                loadLevel(level: 0)
            } else {
                if timeBreakerLevel > highscoreModel.score {
                    highscoreModel.score = timeBreakerLevel
                    modelController?.updateScore(model: highscoreModel)
                }
                isFinished = true
            }
        }
        
    }
}

struct Sound {
    var name: String
    var format: String
}
