//
//  Block.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

class Block: CustomStringConvertible {
    var length: Int
    var orientation: Orientations
    var start: Position
    var color: Colors
    var type: String?
    var isStart: Bool

    enum Orientations {
        case VERTICAL, HORIZONTAL
    }

    enum Colors  {
        case RED, GREY
    }
    
    var end:  Position
    init(length: Int, orientation: Orientations, start: Position, color: Colors, type: String? = "default", isStart: Bool = false) {
        self.length = length
        self.orientation = orientation
        self.start = start
        self.color = color
        self.type = type
        self.isStart = isStart
        // While Start is a parameter, End is calculated by adding the length onto start
        end = orientation == Orientations.HORIZONTAL ? Position(x: start.x + length - 1, y: start.y): Position(x: start.x, y: start.y + length - 1)
    }

    

    /**
     * @param p Position which you are looking for inside the block
     * @return Boolean wether `this` contains the position
     */
    func contains(p: Position) -> Bool {
        switch orientation {
            case Orientations.HORIZONTAL:
                return start.y == p.y && start.x <= p.x && end.x >= p.x
            case Orientations.VERTICAL:
                return start.x == p.x && start.y <= p.y && end.y >= p.y
        }
    }

    /**
     * @param block Block which you are looking for overlaps inside `this`
     * @return boolean whether `this` overlaps with the block
     */
    func contains(block: Block) -> Bool {
        switch block.orientation {
            case Orientations.HORIZONTAL:
                for x in block.start.x...block.end.x {
                    if self.contains(p: Position(x: x, y: block.start.y)) {
                        return true
                    }
                }

                return false
            case Orientations.VERTICAL:
                for y in block.start.y...block.end.y {
                    if self.contains(p: Position(x: block.start.x, y: y)) {
                        return true
                    }
                }

                return false
        }
    }

    /**
     * @params width, height check if the block is positioned inside the grid
     * @return boolean whether the block is inside
     */
    func isValid(width: Int, height: Int) -> Bool {
        return (self.start.x >= 0 && self.start.y >= 0 && self.end.y < height && self.end.x < width)
    }

    var description: String {
        return "X: \(start.x) -> \(end.x) Y: \(start.y) -> \(end.y) Orientation: \(orientation) Length: \(length) color: \(color)"
    }
}
