extension String {
    /**
     Checks if the value of the string on which the function was executed is equal to the given value
    - Parameter value: String to be compared with the value of the given string (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: String) -> TPSQLiteCondition {
        return Eq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is equal to the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: Int) -> TPSQLiteCondition {
        return Eq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is equal to the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: Double) -> TPSQLiteCondition {
        return Eq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is not equal to the given value
    - Parameter value: String to be compared with the value of the given string (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: String) -> TPSQLiteCondition {
        return Neq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is not equal to the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: Int) -> TPSQLiteCondition {
        return Neq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is not equal to the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: Double) -> TPSQLiteCondition {
        return Neq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than the given value
    - Parameter value: String to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: String) -> TPSQLiteCondition {
        return Greater(col: self, col2: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than or equal to the given value
    - Parameter value: String to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: String) -> TPSQLiteCondition {
        return GreaterEq(col: self, col2: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than the given value
    - Parameter value: String to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: String) -> TPSQLiteCondition {
        return Less(col: self, col2: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than or equal to the given value
    - Parameter value: String to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: String) -> TPSQLiteCondition {
        return LessEq(col: self, col2: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: Int) -> TPSQLiteCondition {
        return Greater(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than or equal to the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: Int) -> TPSQLiteCondition {
        return GreaterEq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: Int) -> TPSQLiteCondition {
        return Less(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than or equal to the given value
    - Parameter value: Integer to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: Int) -> TPSQLiteCondition {
        return LessEq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: Double) -> TPSQLiteCondition {
        return Greater(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is greater than or equal to the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: Double) -> TPSQLiteCondition {
        return GreaterEq(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: Double) -> TPSQLiteCondition {
        return Less(col: self, value: value)
    }
    
    /**
     Checks if the value of the string on which the function was executed is less than or equal to the given value
    - Parameter value: Double to be compared with the value of the given string
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: Double) -> TPSQLiteCondition {
        return LessEq(col: self, value: value)
    }
}

extension TPSQLiteCondition {
    /**
     Checks if the value of the condition on which the function was executed is equal to the given value
    - Parameter value: String to be compared with the value of the given condition (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: String) -> TPSQLiteCondition {
        return Eq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is equal to the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: Int) -> TPSQLiteCondition {
        return Eq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is equal to the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func eq(value: Double) -> TPSQLiteCondition {
        return Eq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is not equal to the given value
    - Parameter value: String to be compared with the value of the given condition (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: String) -> TPSQLiteCondition {
        return Neq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is not equal to the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: Int) -> TPSQLiteCondition {
        return Neq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is not equal to the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func neq(value: Double) -> TPSQLiteCondition {
        return Neq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than the given value
    - Parameter value: String to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: String) -> TPSQLiteCondition {
        return Greater(col: self.toString(), col2: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than or equal to the given value
    - Parameter value: String to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: String) -> TPSQLiteCondition {
        return GreaterEq(col: self.toString(), col2: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than the given value
    - Parameter value: String to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: String) -> TPSQLiteCondition {
        return Less(col: self.toString(), col2: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than or equal to the given value
    - Parameter value: String to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: String) -> TPSQLiteCondition {
        return LessEq(col: self.toString(), col2: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: Int) -> TPSQLiteCondition {
        return Greater(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than or equal to the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: Int) -> TPSQLiteCondition {
        return GreaterEq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: Int) -> TPSQLiteCondition {
        return Less(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than or equal to the given value
    - Parameter value: Integer to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: Int) -> TPSQLiteCondition {
        return LessEq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greater(value: Double) -> TPSQLiteCondition {
        return Greater(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is greater than or equal to the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func greaterEq(value: Double) -> TPSQLiteCondition {
        return GreaterEq(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func less(value: Double) -> TPSQLiteCondition {
        return Less(col: self.toString(), value: value)
    }
    
    /**
     Checks if the value of the condition on which the function was executed is less than or equal to the given value
    - Parameter value: Double to be compared with the value of the given condition
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func lessEq(value: Double) -> TPSQLiteCondition {
        return LessEq(col: self.toString(), value: value)
    }
}

extension String {
    /**
     Checks if the value of the string on which the function was executed is like the given value
    - Parameter value: String to be compared with the value of the given string (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func like(value: String) -> TPSQLiteCondition {
        return Like(col: self, value: value)
    }
    /**
     Checks if the value of the string on which the function was executed is not like the given value
    - Parameter value: String to be compared with the value of the given string (we recommend to set '?' as value)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func notLike(value: String) -> TPSQLiteCondition {
        return NotLike(col: self, value: value)
    }
}

extension String {
    /**
     Checks if the value of the string on which the function was executed is not null
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func isNotNull() -> TPSQLiteCondition {
        return IsNotNull(stmt: self)
    }
    
    /**
     Checks if the value of the string on which the function was executed is null
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func isNull() -> TPSQLiteCondition {
        return IsNull(stmt: self)
    }
    
    /**
     Checks if the value of the string on which the function was executed is a part of the given values
    - Parameter values: String representation of the values
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func inList(values: String) -> TPSQLiteCondition {
        return InList(stmt: self, values: values)
    }
    
    /**
     Checks if the value of the string on which the function was executed is a part of the given values
    - Parameter valuesSize: Number of values to be compared ('?' will be used)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func inList(valuesSize: Int) -> TPSQLiteCondition {
        return InList(stmt: self, valuesSize: valuesSize)
    }
    
    /**
     Checks if the value of the string on which the function was executed is not a part of the given values
    - Parameter values: String representation of the values
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func notInList(values: String) -> TPSQLiteCondition {
        return NotInList(stmt: self, values: values)
    }
    
    /**
     Checks if the value of the string on which the function was executed is not a part of the given values
    - Parameter valuesSize: Number of values to be compared ('?' will be used)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func notInList(valuesSize: Int) -> TPSQLiteCondition {
        return NotInList(stmt: self, valuesSize: valuesSize)
    }
    
    /**
     Checks if the value of the string on which the function was executed is between the first given value and the second given value
    - Parameter value1: Lower limit of the range to be compared with the value of the given string (we recommend '?' if the value is of type string)
    - Parameter value2: Upper limit of the range to be compared with the value of the given string (we recommend '?' if the value is of type string)
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func between(value1: Any, value2: Any) -> TPSQLiteCondition {
        if value1 is String {
            return Between(col: self, value1: String(describing: value1), value2: String(describing: value2))
        } else if value1 is Int {
            return Between(col: self, value1: value1 as! Int, value2: value2 as! Int)
        } else if value1 is Double {
            return Between(col: self, value1: value1 as! Double, value2: value2 as! Double)
        } else {
            return Between(col: self, value1: String(describing: value1), value2: String(describing: value2))
        }
    }
}

extension TPSQLiteCondition {
    /**
     Links the condition on which the function was executed and the given condition with a logical AND
    - Parameter value: Object of type TPSQLiteCondtion
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func and(value: TPSQLiteCondition) -> TPSQLiteCondition {
        return TPSQLiteCondition(left: self.toString(), center: " AND ", right: value.toString())
    }
    
    /**
     Links the condition on which the function was executed and the given condition with a logical OR
    - Parameter value: Object of type TPSQLiteCondtion
    - Returns: Object of type TPSQLiteCondtion
    # Reference TPSQLiteCondition
    */
    func or(value: TPSQLiteCondition) -> TPSQLiteCondition {
        return TPSQLiteCondition(left: self.toString(), center: " OR ", right: value.toString())
    }
}
