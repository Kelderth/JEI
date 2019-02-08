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
    
    fileprivate var characters = [TheWireCharacter]()
    
    private let baseUrl: String = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    
    func loadPersistedCharacters() {
        let fetchRequest: NSFetchRequest<TheWireCharacter> = TheWireCharacter.fetchRequest()
        do{
            let charactersPersisted = try StorageManager.persistentContainer.viewContext.fetch(fetchRequest)

                self.characters = charactersPersisted
            
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
        
        let config = parseConfig()
        if let url = URL(string: config.urlString) {
            NetworkManager.performRequest(for: url, httpMethod: .get) { (unsafedata, error) in
                guard let data = unsafedata else { completion([]); return }
                
                do {
                    print(data)
                    let charactersDecoded = JSONParser.decode(json: data, as: TheWireCharacterDecoder.self)!
                    
                    var charactersCD = [TheWireCharacter]()
                    
                    for character in charactersDecoded.relatedTopics {
                        let cdCharacter = TheWireCharacter()
                        
                        cdCharacter.title = self.getText(text: character.text!, element: 0)
                        cdCharacter.url_image = character.icon!.url!
                        cdCharacter.text_description = self.getText(text: character.text!, element: 1)
                        
                        charactersCD.append(cdCharacter)
                    }
                    completion(charactersCD)
                    
                } catch let jsonErr {
                    print("Error serializing json: ", jsonErr)
                    completion([]); return
                }
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
