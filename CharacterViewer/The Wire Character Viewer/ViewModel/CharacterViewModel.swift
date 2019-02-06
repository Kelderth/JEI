//
//  CharacterViewModel.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import Foundation
import CoreData

class CharacterViewModel {
    
    fileprivate var characters = [TheWireCharacter]() {
        didSet {
            self.updateUI?()
        }
    }
    
    private let updateUI: (()->())?
    private let baseUrl: String = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    
    init(callback: (()->())?) {
        self.updateUI = callback
    }
    
    
    
    // MARK: - Presentation
    
    func numberOfItems() -> Int {
        return self.characters.count
    }
    
    func title(index: Int) -> String {
        return self.characters[index].title
    }
    
    func textDescription(index: Int) -> String {
        return self.characters[index].text_description
    }
    
    func urlImage(index: Int) -> String {
        return self.characters[index].url_image ?? "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
    }
    
    func isFavorite(index: Int) -> Bool {
        return self.characters[index].is_favorite
    }
}
