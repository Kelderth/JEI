//
//  JSONParser.swift
//  CoreFramework
//
//  Created by Jesus Sanchez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation

public class JSONParser {
    public static func decode<T: Decodable>(json: Data, as clazz: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            
            let context = StorageManager.persistentContainer.viewContext
            decoder.userInfo[CodingUserInfoKey.context!] = context
            
            let data = try decoder.decode(T.self, from: json)
            return data
        } catch {
            print("An error occurred while parsing JSON")
        }
        
        return nil
    }
}
