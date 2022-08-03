//
//  Grid.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

extension Int {
    func toDouble() -> Double {
        return Double(self)
    }
}

extension Double {
    func toInt() -> Int {
        return Int(self)
    }
}

class Grid {
    var width: Int = 6
    var height: Int = 6
    var blockList: [Block] = [Block]()
    var fixedBlockList: [Block] = [Block]()
    func generate(width: Int?, height: Int?, json: String, level: Int = 0) {
        // if (width != null) this.width = width
        if let widthobject = width {
            self.width = widthobject
        }
        //if (height != null) this.height = height
        if let heightObject = height {
            self.height = heightObject
        }
        
        if level > 0 {
            loadLevel(json: json, level: level)
            blockList.forEach {
                block in
                fixedBlockList.append(block)
            }
        } else {
            blockList.removeAll()
            
            //blockList.addAll(createGrid())
            let tmpList: [Block] = createGrid()
            for x in 0..<tmpList.count {
                blockList += [tmpList[x]]
            }
            
            blockList.forEach {
                block in
                fixedBlockList.append(block)
            }
        }
    }
    
    private func loadLevel(json: String, level: Int) {
        // get JSONObject from JSON file
        let obj = TPJSONObject(string: json)
        
        // fetch JSONArray named levels
        let levelArray: TPJSONArray? = obj.getJSONArray(key: "levels")
        let levelObject = levelArray?.getJSONObject(index: level - 1)
        
        // generate Blocks
        let blockArray: TPJSONArray? = levelObject?.getJSONArray(key: "blocks")
        if let array = blockArray {
            for i in 0..<array.length() {
                let block = array.getJSONObject(index: i)
                if let blockObject = block {
                    let blockLength = blockObject.getInt(key: "length")
                    let blockOrientation = blockObject.getString(key: "orientation")
                    let blockX = blockObject.getInt(key: "x")
                    let blockY = blockObject.getInt(key: "y")
                    let blockType = blockObject.getString(key: "type")
                    var newColor = Block.Colors.GREY
                    var isStart = false
                    if blockObject.has(key: "start") {
                        if blockObject.getBoolean(key: "start") == true {
                            newColor = Block.Colors.RED
                            isStart = true
                        }
                    }
                    
                    var newOrientation = Block.Orientations.VERTICAL
                    if blockOrientation == "HORIZONTAL" {
                        newOrientation = Block.Orientations.HORIZONTAL
                    }
                    
                    blockList.append(Block(length: blockLength!, orientation: newOrientation, start: Position(x: blockX!, y: blockY!), color: newColor, type: blockType, isStart: isStart))
                }
            }
        }
    }
    
    /**
     * Generate a new List of Blocks and test it for solvability
     * @return List<Block> a list of Blocks
     */
    func createGrid() -> [Block] {
        let limit = 20
        
        // Startblock
        var list = [Block]()
        let cars = ["blue_car", "brown_car", "green_car", "lightgreen_car", "orange_car", "red_car", "taxi_car", "white_car"]
        let trucks = ["white_truck", "yellow_bus"]
        
        // Startblock
        let start = Block(length: 2, orientation: Block.Orientations.HORIZONTAL, start: Position(x: width - 2, y: 2), color: Block.Colors.RED, type: "police_car", isStart: true)
        list.append(start)
        let blockCount = TPRandom.int(from: 7, to: 15)
        for i in 0...blockCount {
            let value_1 = (blockCount.toDouble() / 100 * 60).toInt()
            let value_2 = (blockCount.toDouble() / 100 * 30).toInt()
            let sizeDistribution = [0, 0, value_1, value_2, 1]
            
            // Select a more or less unique color for each block (can be extended for true uniqueness)
            let color = Block.Colors.GREY
            
            // Select a Random Orientation
            let allOrientations = [Block.Orientations.HORIZONTAL, Block.Orientations.VERTICAL]
            let orientation = allOrientations[TPRandom.int(from: 0, to: allOrientations.count)]
            
            // Generate a Size that isnt used more than allowed (according to `sizeDistribution`)
            var size = 0
            repeat {
                switch orientation {
                case Block.Orientations.HORIZONTAL:
                    size = TPRandom.int(from: 2, to: 4)
                case Block.Orientations.VERTICAL:
                    size = TPRandom.int(from: 2, to: 3)
                }
            } while sizeDistribution[size] < 1

            var position: Position  // Current Position of the block
            
            var counter = 0
            var block: Block
            var tmpx = 0
            var tmpbool = false
            repeat {
                switch orientation {
                case Block.Orientations.HORIZONTAL:
                    repeat {
                        position = Position(x: TPRandom.int(from: 0, to: width - size), y: TPRandom.int(from: 0, to: height))
                        counter += 1
                    } while position.y == start.start.y
                case Block.Orientations.VERTICAL:
                    position = Position(x: TPRandom.int(from: 0, to: width), y: TPRandom.int(from: 0, to: height - size))
                }
                
                if size == 2 {
                    let type = cars[TPRandom.int(from: 0, to: cars.count)]
                    block = Block(length: size, orientation: orientation, start: position, color: color, type: type)
                } else {
                    let type = trucks[TPRandom.int(from: 0, to: trucks.count)]
                    block = Block(length: size, orientation: orientation, start: position, color: color, type: type)
                }
                
                counter += 1
                while tmpx < list.count {
                    if list[tmpx].contains(block: block) {
                        tmpbool = true
                    }
                    
                    tmpx += 1
                }
                //list.any { it.contains(block) }
            } while (tmpbool || !block.isValid(width: width, height: height)) && counter < limit
            if counter < limit {
                list.append(block)
            }
        }
        
        scramble(list: list)
        
        // Return the List if its valid, create a new one if its not
        return isValid(list: list) ? list : createGrid()
    }
    
    /**
     * @param list input list of blocks to check validity
     * @return Boolean of validity
     */
    func isValid(list: [Block]) -> Bool {
        var valid = false
        let start = list[0]
        if start.end.x > 2 {
            return false
        }
        
        for x in start.start.x...width {
            let pos = Position(x: x, y: start.start.y)
            var tmpx = 1
            var tmpbool = false
            while tmpx < list.count {
                if list[tmpx].contains(p: pos) {
                    tmpbool = true
                }
                
                tmpx += 1
            }
            //if ( list.any { if(it == list[0]) { false }  else (it.contains(pos))}) {
            if tmpbool {
                valid = true
            }
        }
        
        return valid
    }
    
    /**
     * @param list input list of blocks to randomize
     */
    private func scramble(list: [Block]) {
        for i in 0...1000 {
            let block = list[TPRandom.int(from: 0, to: list.count)]
            move(block: block, direction: TPRandom.boolean(), list: list)
        }
    }
    
    /**
     * @param block The block that is supposed to be moved
     * @param direction true if moving forward; false if moving backward
     * @param list the list you want to move the block on (for block generation) blockList by default
     * @return if block has been moved
     */
    func move(block: Block, direction: Bool, list: [Block]? = nil) -> Bool {
        
        var newList: [Block] = blockList
        if let obj = list {
            newList = obj
        }
        
        var positionChanged = false
        let blockStartPosX: Int = block.start.x
        let blockStartPosY: Int = block.start.y
        switch block.orientation {
        case Block.Orientations.HORIZONTAL:
            switch direction {
            case true:
                var tmpx = 0
                var tmpbool = false
                while tmpx < newList.count {
                    if newList[tmpx].contains(p: Position(x: block.end.x + 1, y: block.start.y)) {
                        tmpbool = true
                    }
                    
                    tmpx += 1
                }
                
                if !tmpbool && block.end.x + 1 < width {
                    //if(list.none { it.contains(Position(block.end.x+1, block.start.y))} && block.end.x+1 < width ) {
                    block.start.x += 1
                    block.end.x += 1
                }
                
            case false:
                var tmpx = 0
                var tmpbool = false
                while tmpx < newList.count {
                    if newList[tmpx].contains(p: Position(x: block.start.x - 1, y: block.start.y)) {
                        tmpbool = true
                    }
                    
                    tmpx += 1
                }
                
                if !tmpbool && block.start.x > 0 {
                    //if(list.none { it.contains(Position(block.start.x-1, block.start.y))} && block.start.x > 0) {
                    block.start.x -= 1
                    block.end.x -= 1
                }
            }
            
        case Block.Orientations.VERTICAL:
            switch direction {
            case true:
                var tmpx = 0
                var tmpbool = false
                while tmpx < newList.count {
                    if newList[tmpx].contains(p: Position(x: block.end.x, y: block.end.y + 1)) {
                        tmpbool = true
                    }
                    
                    tmpx += 1
                }
                
                if !tmpbool && block.end.y + 1 < height {
                    //if(list.none {it.contains(Position(block.end.x, block.end.y+1))} && block.end.y+1 < height ) {
                    block.start.y += 1
                    block.end.y += 1
                }
                
            case false:
                var tmpx = 0
                var tmpbool = false
                while tmpx < newList.count {
                    if newList[tmpx].contains(p: Position(x: block.start.x, y: block.start.y - 1)) {
                        tmpbool = true
                    }
                    
                    tmpx += 1
                }
                
                if !tmpbool && block.start.y > 0 {
                    //if(list.none { it.contains(Position(block.start.x, block.start.y-1))} && block.start.y > 0) {
                    block.start.y -= 1
                    block.end.y -= 1
                }
            }
        }
        
        if blockStartPosX != block.start.x || blockStartPosY != block.start.y {
            positionChanged = true
        }
        
        return positionChanged
    }
}
