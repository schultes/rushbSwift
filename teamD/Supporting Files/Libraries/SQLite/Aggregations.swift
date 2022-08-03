//
//  Aggregations.swift
//  templates
//
//  Created by Nicklas Düringer on 18.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
 Represents the SQLite SUM function
- Parameter col: Name of the column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sum(col: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "SUM( ", center: col, right: " ) ")
}

/**
 Represents the SQLite COUNT function
- Parameter col: Name of the column
 - Returns: Object of type TPSQLiteCondtion
 # Reference TPSQLiteCondition
*/
func count(col: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "COUNT( ", center: col, right: " ) ")
}

/**
 Represents the SQLite AVG function
- Parameter col: Name of the column
 - Returns: Object of type TPSQLiteCondtion
 # Reference TPSQLiteCondition
*/
func avg(col: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "AVG( ", center: col, right: " ) ")
}

/**
 Represents the SQLite MIN function
- Parameter col: Name of the column
 - Returns: Object of type TPSQLiteCondtion
 # Reference TPSQLiteCondition
*/
func min(col: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "MIN( ", center: col, right: " ) ")
}

/**
 Represents the SQLite MAX function
- Parameter col: Name of the column
 - Returns: Object of type TPSQLiteCondtion
 # Reference TPSQLiteCondition
*/
func max(col: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "MAX( ", center: col, right: " ) ")
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sum(col: String, value: Int) -> TPSQLiteCondition {
    return sumEq(col: col, value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumEq(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "=", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumGt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: ">", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is less than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumLt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "<", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumGe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumLe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func count(col: String, value: Int) -> TPSQLiteCondition {
    return countEq(col: col, value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countEq(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is greater than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countGt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: ">", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is less than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countLt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "<", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countGe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countLe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avg(col: String, value: Int) -> TPSQLiteCondition {
    return avgEq(col: col, value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgEq(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is greater than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgGt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: ">", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is less than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgLt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "<", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgGe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgLe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func min(col: String, value: Int) -> TPSQLiteCondition {
    return minEq(col: col, value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minEq(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minGt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: ">", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is less than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minLt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "<", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minGe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minLe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func max(col: String, value: Int) -> TPSQLiteCondition {
    return maxEq(col: col, value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxEq(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxGt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: ">", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is less than a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxLt(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "<", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxGe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxLe(col: String, value: Int) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "<=", value: value)
}

private func agg(funcName: String, col: String, op: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "\(funcName)(", center: col, right: ") \(op) \(value)")
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumEq(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "=", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumGt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: ">", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is less than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumLt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "<", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumGe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite SUM function to a given column and checks if its sum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the SUM function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func sumLe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "SUM", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func count(col: String, value: Double) -> TPSQLiteCondition {
    return countEq(col: col, value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countEq(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is greater than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countGt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: ">", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is less than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countLt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "<", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countGe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite COUNT function to a given column and checks if its count is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the COUNT function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func countLe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "COUNT", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avg(col: String, value: Double) -> TPSQLiteCondition {
    return avgEq(col: col, value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgEq(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is greater than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgGt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: ">", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is less than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgLt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "<", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgGe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite AVG function to a given column and checks if its average is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the AVG function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func avgLe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "AVG", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func min(col: String, value: Double) -> TPSQLiteCondition {
    return minEq(col: col, value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minEq(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minGt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: ">", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is less than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minLt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "<", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minGe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite MIN function to a given column and checks if its minimum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MIN function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func minLe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MIN", col: col, op: "<=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func max(col: String, value: Double) -> TPSQLiteCondition {
    return maxEq(col: col, value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxEq(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is greater than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxGt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: ">", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is less than a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxLt(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "<", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is greater than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxGe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: ">=", value: value)
}

/**
 Applies the SQLite MAX function to a given column and checks if its maximum is less than or equal to a given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the result of the MAX function
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func maxLe(col: String, value: Double) -> TPSQLiteCondition {
    return agg(funcName: "MAX", col: col, op: "<=", value: value)
}

private func agg(funcName: String, col: String, op: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "\(funcName)(", center: col, right: ") \(op) \(value)")
}
