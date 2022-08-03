//
//  Operators.swift
//  templates
//
//  Created by Nicklas Düringer on 18.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
 Takes a column and checks if its value is equal to the given value
- Parameter col: Name of the column
- Parameter value: String to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter useRawValue: Boolean that defines whether to use the given value directly in the condition, otherwise '?' is used
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Eq(col: String, value: String, useRawValue: Bool = false) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "=", right: useRawValue ? value : "?")
}

/**
 Takes a column and checks if its value is not equal to the given value
- Parameter col: Name of the column
- Parameter value: String to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter useRawValue: Boolean that defines whether to use the given value directly in the condition, otherwise '?' is used
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Neq(col: String, value: String, useRawValue: Bool = false) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "!=", right: useRawValue ? value : "?")
}

/**
 Takes a column and checks if its value is equal to the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Eq(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is not equal to the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Neq(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "!=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is equal to the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Eq(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is not equal to the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Neq(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "!=", right: String(describing: value))
}

/**
 Takes two columns and checks if the value of the first is greater than the value of the second
- Parameter col: Name of the first column
- Parameter col2: Name of the first column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Greater(col: String, col2: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">", right: col2)
}

/**
 Takes two columns and checks if the value of the first is greater than or equal to the value of the second
- Parameter col: Name of the first column
- Parameter col2: Name of the first column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func GreaterEq(col: String, col2: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">=", right: col2)
}

/**
 Takes two columns and checks if the value of the first is less than the value of the second
- Parameter col: Name of the first column
- Parameter col2: Name of the first column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Less(col: String, col2: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<", right: col2)
}

/**
 Takes two columns and checks if the value of the first is less than or equal to the value of the second
- Parameter col: Name of the first column
- Parameter col2: Name of the first column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func LessEq(col: String, col2: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<=", right: col2)
}

/**
 Takes a column and checks if its value is greater than the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Greater(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">", right: String(describing: value))
}

/**
 Takes a column and checks if its value is greater than or equal to the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func GreaterEq(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is less than the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Less(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<", right: String(describing: value))
}

/**
 Takes a column and checks if its value is less than or equal to the given value
- Parameter col: Name of the column
- Parameter value: Integer to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func LessEq(col: String, value: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is greater than the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Greater(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">", right: String(describing: value))
}

/**
 Takes a column and checks if its value is greater than or equal to the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func GreaterEq(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: ">=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is less than the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Less(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<", right: String(describing: value))
}

/**
 Takes a column and checks if its value is less than or equal to the given value
- Parameter col: Name of the column
- Parameter value: Double to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func LessEq(col: String, value: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "<=", right: String(describing: value))
}

/**
 Takes a column and checks if its value is like the given value
- Parameter col: Name of the column
- Parameter value: String to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter useRawValue: Boolean that defines whether to use the given value directly in the condition, otherwise '?' is used
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Like(col: String, value: String, useRawValue: Bool = false) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "LIKE", right: useRawValue ? "'\(value.replacingOccurrences(of: "'", with: "''"))'" : "?")
}

/**
 Takes a column and checks if its value is not like the given value
- Parameter col: Name of the column
- Parameter value: String to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter useRawValue: Boolean that defines whether to use the given value directly in the condition, otherwise '?' is used
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func NotLike(col: String, value: String, useRawValue: Bool = false) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: col, center: "NOT LIKE", right: useRawValue ? "'\(value.replacingOccurrences(of: "'", with: "''"))'" : "?")
}

/**
 Takes a column and checks if its value is between the first given value and the second given value
- Parameter col: Name of the column
- Parameter value1: Lower limit of the range to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter value2: Upper limit of the range to be compared with the value of the given column (if useRawValue isn't explicitly set true, we recommend to set '?' as value)
- Parameter useRawValue: Boolean that defines whether to use the given values directly in the condition, otherwise '?' is used
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Between(col: String, value1: String, value2: String, useRawValue: Bool = false) -> TPSQLiteCondition {
    if !useRawValue {
        return TPSQLiteCondition(left: "\(col) BETWEEN ", center: "?", right: " AND ?")
    }
    
    return TPSQLiteCondition(left: "\(col) BETWEEN ", center: value1, right: " AND \(value2)")
}

/**
 Takes a column and checks if its value is between the first given value and the second given value
- Parameter col: Name of the column
- Parameter value1: Lower limit of the range to be compared with the value of the given column
- Parameter value2: Upper limit of the range to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Between(col: String, value1: Int, value2: Int) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "\(col) BETWEEN ", center: "\(value1)", right: " AND \(value2)")
}

/**
 Takes a column and checks if its value is between the first given value and the second given value
- Parameter col: Name of the column
- Parameter value1: Lower limit of the range to be compared with the value of the given column
- Parameter value2: Upper limit of the range to be compared with the value of the given column
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Between(col: String, value1: Double, value2: Double) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "\(col) BETWEEN ", center: "\(value1)", right: " AND \(value2)")
}

/**
 Takes a statement and checks if its not null
- Parameter stmt: String representation of the statement
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func IsNotNull(stmt: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: stmt, right: "IS NOT NULL")
}

/**
 Takes a statement and checks if its null
- Parameter stmt: String representation of the statement
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func IsNull(stmt: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: stmt, right: "IS NULL")
}

/**
 Takes a statement and checks if its a part of the given values
- Parameter stmt: String representation of the statement
- Parameter values: String representation of the values
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func InList(stmt: String, values: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: stmt, center: "IN", right: "(\(values))")
}

/**
 Takes a statement and checks if its a part of the given values
- Parameter stmt: String representation of the statement
- Parameter valuesSize: Number of values to be compared ('?' will be used)
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func InList(stmt: String, valuesSize: Int) -> TPSQLiteCondition {
    var valEsp = ""
    for _ in 1...valuesSize {
        valEsp += "?,"
    }
    valEsp.remove(at: valEsp.index(before: valEsp.endIndex))
    return TPSQLiteCondition(left: stmt, center: "IN", right: "(\(valEsp))")
}

/**
 Takes a statement and checks if its not a part of the given values
- Parameter stmt: String representation of the statement
- Parameter values: String representation of the values
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func NotInList(stmt: String, values: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: stmt, center: "NOT IN", right: "(\(values))")
}

/**
 Takes a statement and checks if its not a part of the given values
- Parameter stmt: String representation of the statement
- Parameter valuesSize: Number of values to be compared ('?' will be used)
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func NotInList(stmt: String, valuesSize: Int) -> TPSQLiteCondition {
    var valEsp = ""
    for _ in 1...valuesSize {
        valEsp += "?,"
    }
    valEsp.remove(at: valEsp.index(before: valEsp.endIndex))
    return TPSQLiteCondition(left: stmt, center: "NOT IN", right: "(\(valEsp))")
}

/**
 Encloses the specified condition in parentheses
- Parameter value: Object of type TPSQLiteCondtion
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Sub(value: TPSQLiteCondition) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "( ", center: value.toString(), right: " )")
}

/**
 Encloses the specified condition in parentheses
- Parameter value: String representation of the condition
- Returns: Object of type TPSQLiteCondtion
# Reference TPSQLiteCondition
*/
func Sub(value: String) -> TPSQLiteCondition {
    return TPSQLiteCondition(left: "( ", center: value, right: " )")
}
