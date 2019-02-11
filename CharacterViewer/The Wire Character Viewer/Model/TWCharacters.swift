//
//  TheWireCharacterDecoder.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/7/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation

struct TWCharacters: Decodable {
    let characterArray: [TWCharacter]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        characterArray = try container.decode([TWCharacter].self, forKey: .response)
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "RelatedTopics"
    }
}
struct TWCharacter: Decodable  {
    
    let imageURL: String
    let description: String
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let icon = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .Icon)
        description = try container.decode(String.self, forKey: .description)
        imageURL = try icon.decode(String.self, forKey: .imageURL)
    }
    
    enum CodingKeys: String, CodingKey {
        case Icon
        case imageURL = "URL"
        case description = "Text"
    }
}
