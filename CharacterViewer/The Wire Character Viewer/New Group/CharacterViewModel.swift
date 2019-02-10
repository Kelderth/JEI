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
    
    //let config = parseConfig()
    
    fileprivate var characters = [TheWireCharacter]()
    
    private let baseUrl: String = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    
    func loadPersistedCharacters() {
        let fetchRequest: NSFetchRequest<TheWireCharacter> = TheWireCharacter.fetchRequest()
        do{
//            let charactersPersisted = try StorageManager.context.fetch(fetchRequest)
//
//                self.characters = charactersPersisted
            
        } catch {
            self.characters = []
        }
    
    }
    
    func fetchCharacters() {
        
        self.downloadCharacters() { [weak self] (_) in
            self?.updateCharacters()
        }
    }
    
    private func updateCharacters() {
        StorageManager.saveContext()
        self.loadPersistedCharacters()
    }
    
    func downloadCharacters(completion: @escaping ([TheWireCharacter]) -> Void) {
        
        
//        let url = URL(string: config.urlString)
//
//        NetworkManager.performRequest(for: url, httpMethod: .get) { (data, error) in
//            guard let data = data else { completion(nil); return }
//
//
//            do {
//
//                let charactersDecoded = try JSONDecoder().decode(Products.self, from: data)
//                self.characters = productListDecoded.products
//
//                completion(charactersDecoded)
//
//            } catch let jsonErr {
//                print("Error serializing json: ", jsonErr)
//                completion(nil)
//            }
//        }
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
//        return self.characters[index].title
        return "JEI"
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
