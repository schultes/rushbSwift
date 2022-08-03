//
//  TPSQLiteQuery.swift
//  templates
//
//  Created by Nicklas Düringer on 18.06.21.
//  Copyright © 2021 THM. All rights reserved.
//

import Foundation

/**
Represents the structure of a SQLite query
*/
class TPSQLiteQuery {
    private var currentTable: String = ""
    private var colsToSelect: OrderedDictionary<String, [String]> = OrderedDictionary()
    private var from = Array<String>()
    private var whereConditions = Array<Statement>()
    private var tablesToJoin: OrderedDictionary<String, [Statement]> = OrderedDictionary()
    private var groupBys = Array<String>()
    private var havingConditions = Array<Statement>()
    private var orderBys = Array<Sort>()
    private var limitOffset: Array<Int>? = nil
    func toSQL() -> String {
        var _result = ""
        let _select = CompileSelect()
        let _from = CompileFrom()
        let _joins = CompileJoins()
        let _where = CompileWhere()
        let _groupBy = CompileGroupBy()
        let _having = CompileHaving()
        let _orderBy = CompileOrderBy()
        let _limit = CompileLimit()
        _result += "SELECT \(_select)"
        _result += " FROM \(_from)"
        if !_joins.isEmpty {
            _result += " \(_joins)"
        }
        
        
        if !_where.isEmpty {
            _result += " WHERE \(_where)"
        }
        
        
        if !_groupBy.isEmpty {
            _result += " GROUP BY \(_groupBy)"
        }
        
        
        if !_groupBy.isEmpty && !_having.isEmpty {
            _result += " HAVING \(_having)"
        }
        
        
        if !_orderBy.isEmpty {
            _result += " ORDER BY \(_orderBy)"
        }
        
        
        if !_limit.isEmpty {
            _result += " LIMIT \(_limit)"
        }
        return _result
    }
    
    /**
     Explicitly specifies the associated table for given columns (must be called before the select method)
    - Parameter name: Name of the table
    */
    func Table(name: String) -> TPSQLiteQuery {
        currentTable = name
        return self
    }
    
    /**
     Holds the relevant columns for the  SELECT clause of the query
    - Parameter cols: One or more column names
    */
    func Select(cols: String...) -> TPSQLiteQuery {
        colsToSelect[currentTable] = cols
        return self
    }
    
    /**
     Holds the relevant table for the FROM clause of the query
    - Parameter table: Name of the table
    */
    func From(table: String) -> TPSQLiteQuery {
        from.append(table)
        return self
    }
    
    /**
     Holds the relevant tables for the FROM clause of the query
    - Parameter tables: One or more table names
    */
    func From(tables: String...) -> TPSQLiteQuery {
        from.append(contentsOf: tables)
        return self
    }
    
    /**
     Holds a subquery for the FROM clause of the query
    - Parameter table: Object of TPSQLiteQuery, which represents the subquery
    # Reference TPSQLiteQuery
    */
    func From(query: TPSQLiteQuery) -> TPSQLiteQuery {
        from.append("(\(query.toSQL())")
        return self
    }
    
    /**
     Holds a join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func Join(table: String) -> TPSQLiteQuery {
        tablesToJoin["JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a left join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func LeftJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["LEFT-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a left outer join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func LeftOuterJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["LEFT-OUTER-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a right join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func RightJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["RIGHT-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a right outer join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func RightOuterJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["RIGHT-OUTER-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a inner join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func InnerJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["INNER-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds a cross join for the specified table (don't forget to call the join condition)
    - Parameter table: Name of the table to be joined
    # Reference On
    */
    func CrossJoin(table: String) -> TPSQLiteQuery {
        tablesToJoin["CROSS-JOIN-" + table] = []
        return self
    }
    
    /**
     Holds the join condition for the previously defined join
    - Parameter condition: Object of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func On(condition: TPSQLiteCondition) -> TPSQLiteQuery {
        if tablesToJoin.count > 0 {
            if let tblKey = tablesToJoin.keys.last {
                tablesToJoin[tblKey]?.append(And(logic: condition.toString()))
            }
        }
        return self
    }
    
    /**
     Holds the join conditions for the previously defined join
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func On(useOr: Bool = false, conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        if useOr {
            for condition in conditions {
                if tablesToJoin.count > 0 {
                    if let tblKey = tablesToJoin.keys.last {
                        tablesToJoin[tblKey]?.append(Or(logic: condition.toString()))
                    }
                }
            }
        } else {
            for condition in conditions {
                if tablesToJoin.count > 0 {
                    if let tblKey = tablesToJoin.keys.last {
                        tablesToJoin[tblKey]?.append(And(logic: condition.toString()))
                    }
                }
            }
        }
        return self
    }
    
    /**
     Holds the join conditions for the previously defined join
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func On(conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        for condition in conditions {
            if tablesToJoin.count > 0 {
                if let tblKey = tablesToJoin.keys.last {
                    tablesToJoin[tblKey]?.append(And(logic: condition.toString()))
                }
            }
        }
        return self
    }
    
    /**
     Holds the join condition for the previously defined join
    - Parameter condition: String representation of the condition
    */
    func On(condition: String) -> TPSQLiteQuery {
        if tablesToJoin.count > 0 {
            if let tblKey = tablesToJoin.keys.last {
                tablesToJoin[tblKey]?.append(And(logic: condition))
            }
        }
        return self
    }
    
    /**
     Holds the join conditions for the previously defined join
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: One or more string representations of the conditions
    */
    func On(useOr: Bool = false, conditions: String...) -> TPSQLiteQuery {
        if useOr {
            for condition in conditions {
                if tablesToJoin.count > 0 {
                    if let tblKey = tablesToJoin.keys.last {
                        tablesToJoin[tblKey]?.append(Or(logic: condition))
                    }
                }
            }
        } else {
            for condition in conditions {
                if tablesToJoin.count > 0 {
                    if let tblKey = tablesToJoin.keys.last {
                        tablesToJoin[tblKey]?.append(And(logic: condition))
                    }
                }
            }
        }
        return self
    }
    
    /**
     Holds the join conditions for the previously defined join
    - Parameter conditions: One or more string representations of the conditions
    */
    func On(conditions: String...) -> TPSQLiteQuery {
        for condition in conditions {
            if tablesToJoin.count > 0 {
                if let tblKey = tablesToJoin.keys.last {
                    tablesToJoin[tblKey]?.append(And(logic: condition))
                }
            }
        }
        return self
    }
    
    /**
     Holds the condition for the WHERE clause of the query
    - Parameter condition: Object of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Where(condition: TPSQLiteCondition) -> TPSQLiteQuery {
        whereConditions.append(And(logic: condition.toString()))
        return self
    }
    
    /**
     Holds the conditions for the WHERE clause of the query
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Where(useOr: Bool = false, conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        if useOr {
            conditions.forEach {
                whereConditions.append(Or(logic: $0.toString()))
            }
        } else {
            conditions.forEach {
                whereConditions.append(And(logic: $0.toString()))
            }
        }
        return self
    }
    
    /**
     Holds the conditions for the WHERE clause of the query
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Where(conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        conditions.forEach {
            whereConditions.append(And(logic: $0.toString()))
        }
        return self
    }
    
    /**
     Holds the condition for the WHERE clause of the query
    - Parameter condition: String representation of the condition
    */
    func Where(condition: String) -> TPSQLiteQuery {
        whereConditions.append(And(logic: condition))
        return self
    }
    
    /**
     Holds the conditions for the WHERE clause of the query
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: One or more string representations of the conditions
    */
    func Where(useOr: Bool = false, conditions: String...) -> TPSQLiteQuery {
        if useOr {
            conditions.forEach {
                whereConditions.append(Or(logic: $0))
            }
        } else {
            conditions.forEach {
                whereConditions.append(And(logic: $0))
            }
        }
        return self
    }
    
    /**
     Holds the join conditions for the previously defined join
    - Parameter conditions: One or more string representations of the conditions
    */
    func Where(conditions: String...) -> TPSQLiteQuery {
        conditions.forEach {
            whereConditions.append(And(logic: $0))
        }
        return self
    }
    
    /**
     Holds the columns for the GROUP BY clause
    - Parameter cols: One or more column names
    */
    func GroupBy(cols: String...) -> TPSQLiteQuery {
        groupBys.append(contentsOf: cols)
        return self
    }
    
    /**
     Holds the column for the GROUP BY clause
    - Parameter cols: Name of the column
    */
    func GroupBy(col: String) -> TPSQLiteQuery {
        groupBys.append(col)
        return self
    }
    
    /**
     Holds the columns for the GROUP BY clause
    - Parameter cols: Array of column names
    */
    func GroupBy(cols: [String]) -> TPSQLiteQuery {
        groupBys.append(contentsOf: cols)
        return self
    }
    
    /**
     Holds the condition for the HAVING clause of the query
    - Parameter condition: Object of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Having(condition: TPSQLiteCondition) -> TPSQLiteQuery {
        havingConditions.append(And(logic: condition.toString()))
        return self
    }
    
    /**
     Holds the conditions for the HAVING clause of the query
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Having(useOr: Bool = false, conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        if useOr {
            conditions.forEach {
                havingConditions.append(Or(logic: $0.toString()))
            }
        } else {
            conditions.forEach {
                havingConditions.append(And(logic: $0.toString()))
            }
        }
        return self
    }
    
    /**
     Holds the conditions for the HAVING clause of the query
    - Parameter conditions: Objects of TPSQLiteCondition
    # Reference TPSQLiteCondition
    */
    func Having(conditions: TPSQLiteCondition...) -> TPSQLiteQuery {
        conditions.forEach {
            havingConditions.append(And(logic: $0.toString()))
        }
        return self
    }
    
    /**
     Holds the condition for the HAVING clause of the query
    - Parameter condition: String representation of the condition
    */
    func Having(condition: String) -> TPSQLiteQuery {
        havingConditions.append(And(logic: condition))
        return self
    }
    
    /**
     Holds the conditions for the HAVING clause of the query
    - Parameter useOr: Boolean that defines whether the conditions are linked via an AND or an OR.
    - Parameter conditions: One or more string representations of the conditions
    */
    func Having(useOr: Bool = false, conditions: String...) -> TPSQLiteQuery {
        if useOr {
            conditions.forEach {
                havingConditions.append(Or(logic: $0))
            }
        } else {
            conditions.forEach {
                havingConditions.append(And(logic: $0))
            }
        }
        return self
    }
    
    /**
     Holds the conditions for the HAVING clause of the query
    - Parameter conditions: One or more string representations of the conditions
    */
    func Having(conditions: String...) -> TPSQLiteQuery {
        conditions.forEach {
            havingConditions.append(And(logic: $0))
        }
        return self
    }
    
    /**
     Holds the columns for the ORDER BY clause
    - Parameter cols: One or more column names
    */
    func OrderBy(cols: String...) -> TPSQLiteQuery {
        cols.forEach {
            orderBys.append(Asc(col: $0))
        }
        return self
    }
    
    /**
     Holds the columns for the ORDER BY clause
    - Parameter cols: One or more objects of Asc or Desc
    # Reference Asc
    # Reference Desc
    */
    func OrderBy(cols: Sort...) -> TPSQLiteQuery {
        cols.forEach {
            orderBys.append($0)
        }
        return self
    }
    
    /**
     Holds the columns for the ORDER BY clause in ascending order
    - Parameter cols: One or more column names
    */
    func OrderByAsc(cols: String...) -> TPSQLiteQuery {
        cols.forEach {
            orderBys.append(Asc(col: $0))
        }
        return self
    }
    
    /**
     Holds the columns for the ORDER BY clause in descending order
    - Parameter cols: One or more column names
    */
    func OrderByDesc(cols: String...) -> TPSQLiteQuery {
        cols.forEach {
            orderBys.append(Desc(col: $0))
        }
        return self
    }
    
    /**
     Holds the number of rows for the LIMIT clause
    - Parameter rowCount: Number of rows to be constraint
    - Parameter offset: Number from which the result set should start
    */
    func Limit(rowCount: Int, offset: Int = 0) -> TPSQLiteQuery {
        limitOffset = [rowCount, offset]
        return self
    }
    
    private func CompileSelect() -> String {
        var selectCols = [String]()
        for (tbl, cols) in colsToSelect {
            if tbl == "" {
                selectCols.append(cols.joined(separator: ", "))
            } else {
                cols.forEach {
                    selectCols.append("\(tbl).\($0)")
                }
            }
        }
        
        return selectCols.joined(separator: ", ")
    }
    
    private func CompileFrom() -> String {
        var result = ""
        for (index, tbl) in from.enumerated() {
            if index == self.from.count - 1 {
                result += tbl
            } else {
                result += "\(tbl), "
            }
        }
        return result
    }
    
    private func CompileWhere() -> String {
        var result = ""
        whereConditions.forEach {
            result += " \($0.getStatement()) \($0.getOperator())"
        }
        
        if result != "" {
            let start = result.firstIndex(of: result.first!)
            let end = result.index(result.endIndex, offsetBy: -3)
            let range = start!..<end
            let substring = result[range]
            result = String(substring).trimmingCharacters(in: .whitespaces)
        }
        
        return result
    }
    
    private func CompileJoins() -> String {
        var result = ""
        for (join, conditions) in tablesToJoin {
            let parts = join.components(separatedBy: "-")
            let tbl = parts.last
            let joinStmt = parts[0...parts.count - 1].joined(separator: " ")
            var joinConditions = ""
            conditions.forEach {
                joinConditions += " \($0.getStatement()) \($0.getOperator())"
            }
            
            if joinConditions != "" {
                let start = joinConditions.firstIndex(of: joinConditions.first!)
                let end = joinConditions.index(joinConditions.endIndex, offsetBy: -3)
                let range = start!..<end
                let substring = joinConditions[range]
                joinConditions = String(substring)
                result += "\(joinStmt) \(tbl!) ON (\(joinConditions))"
            }
        }
        
        return result
    }
    
    private func CompileGroupBy() -> String {
        return groupBys.joined(separator: ", ")
    }
    
    private func CompileHaving() -> String {
        var result = ""
        for (_, stmt) in havingConditions.enumerated() {
            result += " \(stmt.getStatement()) \(stmt.getOperator())"
        }
        
        if result != "" {
            let start = result.firstIndex(of: result.first!)
            let end = result.index(result.endIndex, offsetBy: -3)
            let range = start!..<end
            let substring = result[range]
            result = String(substring).trimmingCharacters(in: .whitespaces)
        }
        
        return result
    }
    
    private func CompileOrderBy() -> String {
        var result = ""
        orderBys.forEach {
            result += "\($0.col) \($0.getDirection()), "
        }
        
        if result != "" {
            let start = result.firstIndex(of: result.first!)
            let end = result.index(result.endIndex, offsetBy: -2)
            let range = start!..<end
            let substring = result[range]
            result = String(substring).trimmingCharacters(in: .whitespaces)
        }
        
        return result
    }
    
    private func CompileLimit() -> String {
        var result = ""
        if limitOffset != nil {
            result = "\(limitOffset![0]) OFFSET \(limitOffset![1])"
        }
        
        return result
    }
}
