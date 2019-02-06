//
//  PropertiesModel.swift
//  The Wire Character Viewer
//
//  Created by Jesus Sanchez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation

struct Config: Decodable {
    private enum CodingKeys: String, CodingKey {
        case urlString
        case dataModel
        case appName
    }
    
    let urlString: String
    let dataModel: String
    let appName: String
}
