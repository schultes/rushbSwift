//
//  Position.swift
//  teamD
//
//  Created by FMA1 on 27.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

class Position: CustomStringConvertible {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    /**
     * @return String of Object
     */
    var description: String {
        return "{x: \(x), y: \(y)} "
    }

    /**
     *  @param pos Position you want the difference to
     *  @return Position with the difference between `this` and `pos`
     */
    func minus(pos: Position) -> Position {
        return Position(x: self.x - pos.x, y: self.y - pos.y)
    }

    /**
     * @param other the opposite Position you want to check the equality
     * @return Boolean whether this Position is the same as other
     */
    func equals(other: Position?) -> Bool {
        if let position = other {
            return position.x == self.x && position.y == self.y
        }
        return false
    }

    /**
     * @param other target for comparation
     * @return positive, if is larger, negative, if is smaller, and 0 if the same
     */
    func compareTo(other: Position) -> Int {
        let diff: Position = other.minus(pos: self)
        if diff.x > 0 || diff.y > 0 {
            return 1
        } else if diff.x < 0 || diff.y < 0 {
            return -1
        } else {
            return 0
        }
    }

    func hashCode() -> Int {
        var result = x
        result = 31 * result + y
        return result
    }
}
