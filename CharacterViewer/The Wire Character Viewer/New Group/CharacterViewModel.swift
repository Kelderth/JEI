//
//  CharacterViewModel.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//
import Foundation
//import CoreData
import CoreFramework

class CharacterViewModel {
    
    fileprivate var characters = [TWCharacter]()
    
    fileprivate let baseUrl: String = "https://api.duckduckgo.com/"
    
    func loadPersistedCharacters() {
//        let fetchRequest: NSFetchRequest<TheWireCharacter> = TheWireCharacter.fetchRequest()
//        do {
//            let charactersPersisted = try StorageManager.persistentContainer.viewContext.fetch(fetchRequest)
//            self.characters = charactersPersisted
//        } catch {
//            self.characters = []
//        }
    }
    
    func fetchCharacters(completion: @escaping ()->Void) {
        self.downloadCharacters() { [weak self] (_) in
            //self?.updateCharacters()
            completion()
        }
    }
    
    private func updateCharacters() {
//        StorageManager.saveContext()
//        self.loadPersistedCharacters()
    }
    
    func downloadCharacters(completion: @escaping ([TWCharacter]) -> Void) {
        let config = parseConfig()
        if let url = URL(string: config.urlString) {
            let urlParams: [String : String] = ["q" : "the+wire+characters", "format" : "json"]
            
            NetworkManager.performRequest(for: url, httpMethod: .get, urlParameters: urlParams) { (unsafedata, error) in
                guard let data = unsafedata else { completion([]); return }
                
                let charactersDecoded = JSONParser.decode(json: data, as: TWCharacters.self)!
                //var charactersCD = [TheWireCharacter]()
                
                for character in charactersDecoded.characterArray {
//                    let cdCharacter = TheWireCharacter()
//
//                    cdCharacter.title = self.getText(text: character.description, element: 0)
//                    cdCharacter.url_image = character.imageURL
//                    cdCharacter.text_description = self.getText(text: character.description, element: 1)
                    
                    self.characters.append(character)
                }
                completion(self.characters)
            }
        }
    }
    
    private func getText(text: String, element: Int) -> String {
        let result = text.split(separator: "-")[element]
        if element == 0 {
            return String(result.split(separator: "(")[0])
        }
        return String(result)
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
//        return "TWC"
        return self.getText(text: self.characters[index].description, element: 0)
    }
    
    func textDescription(index: Int) -> String {
        return self.getText(text: self.characters[index].description, element: 1)
    }
    
    func urlImage(index: Int) -> String {
        return self.characters[index].imageURL ?? "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
    }
    
    func isFavorite(index: Int) -> Bool {
        return self.characters[index].isFavorite
    }
}
