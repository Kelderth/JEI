//
//  CharacterViewModel.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//
import Foundation
import CoreData
import CoreFramework

class CharacterViewModel {
    
    let config = parseConfig()
    
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
    
    func downloadCharacters() {
        
        let url = URL(string: config.urlString)
        
        NetworkManager.performRequest(for: url, httpMethod: .get) { (data, error) in
            guard let data = data else { completion(nil); return }
            
            
            do {
                
                let charactersDecoded = try JSONDecoder().decode(Products.self, from: data)
                self.characters = productListDecoded.products
                
                completion(charactersDecoded)
                
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
                completion(nil)
            }
        }
    }
    
    func parseConfig() -> Config {
        let url = Bundle.main.url(forResource: "Config", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(Config.self, from: data)
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
