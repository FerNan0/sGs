//
//  BDSQLite.swift
//  sGs
//
//  Created by Fernando F Duarte on 18/06/18.
//  Copyright © 2018 Fernando F Duarte. All rights reserved.
//

import Foundation
import UIKit
import SQLite3


class BDSQLite: NSObject {
    
    var db: OpaquePointer?
    
    func openDatabase() -> Bool {
        //the database file
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("HeroesDatabase.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        return true
    }
    
    func closeDatabase() {
        if sqlite3_finalize(db) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        db = nil
    }
    
    func criaTabelaMano() -> Bool{
        
        if sqlite3_exec(db, "create table if not exists mano (id integer primary key autoincrement, nome text, esporte text, cidade text, email text, nota real)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
            return false
        }
        
        return true
    }
    
    func selecionaManos() -> Array<Mano> {
        var statement: OpaquePointer?
        var manos = [Mano]()
        
        if sqlite3_prepare_v2(db, "select * from mano", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let manoAux = Mano()
            
            let id = sqlite3_column_int64(statement, 0)
            manoAux.idMano = Int(id)
            let nome = sqlite3_column_text(statement, 1)
            manoAux.nome = String(cString: nome!)
            let esporte = sqlite3_column_text(statement, 2)
            manoAux.esporte = String(cString: esporte!)
            let cidade = sqlite3_column_text(statement, 3)
            manoAux.cidade = String(cString: cidade!)
            let email = sqlite3_column_text(statement, 4)
            manoAux.email = String(cString: email!)
            let nota = sqlite3_column_double(statement, 5)            
            manoAux.nota = Float(nota)
            
            manos.append(manoAux)
        }
        return manos
    }
    
    func insereMano(mano:Mano) -> Bool {
        var stmt: OpaquePointer?
         let queryString = "insert into mano (nome, esporte, cidade, email, nota) values (?,?,?,?,?)"
    
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return false
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, mano.nome, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return false
        }
        
        if sqlite3_bind_text(stmt, 2, mano.esporte, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return false
        }
        
        if sqlite3_bind_text(stmt, 3, mano.cidade, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return false
        }
        
        if sqlite3_bind_text(stmt, 4, mano.email, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return false
        }
        if sqlite3_bind_double(stmt, 5, 5.5) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return false
        }
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return false
        }
        
        return true
    }
    
}
