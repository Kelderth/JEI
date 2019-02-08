//
//  TheWireCharacterDecoder.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/7/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation

class TheWireCharacterDecoder: Decodable {
   
    let relatedTopics: [RelatedTopic]
    
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

class RelatedTopic: Decodable {
    let icon: TWCIcon
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case text = "Text"
    }
}

class TWCIcon: Decodable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "URL"
    }
}
