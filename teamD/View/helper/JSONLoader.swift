//
//  JSONLoader.swift
//  teamD
//
//  Created by FMA1 on 01.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import Foundation

class JSONLoader {
    
    func readProjectFile(forName name: String) -> Data? {
            do {
                if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    return jsonData
                }
            } catch {
                print(error)
            }
            
            return nil
        }
        
        func readProjectFileAsString(forName name: String) -> String?{
            do {
                if let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
                    let jsonData = try String(contentsOfFile: bundlePath)
                    return jsonData
                }
            } catch {
                print(error)
            }
            
            return nil
        }
        
        func saveToLocalFile(filename: String, data: Data) {
            do {
                let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let fileUrl = documentDirectory.appendingPathComponent(filename + ".json")
                try data.write(to: fileUrl)
            } catch {
                print(error)
            }
            
        }

}
