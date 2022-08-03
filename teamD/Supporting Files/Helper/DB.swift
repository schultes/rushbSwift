//
//  DB.swift
//  teamD
//
//  Created by FMA1 on 28.08.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

class DB {
    static var conn: TPSQLite? = nil
    func createConn() {
        do {
            DB.conn = try TPSQLite.open(dbName: "database")
        } catch TPSQLiteError.OpenDatabase(message: _) {
            print("Unable to open Database")
        } catch {
            print("Unexpected error")
        }
    }
}
