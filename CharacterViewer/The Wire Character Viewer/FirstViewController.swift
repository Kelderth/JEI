//
//  FirstViewController.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//
import UIKit
import CoreData
import CoreFramework

class FirstViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    var characters = [TheWireCharacter]()
    
    /// Parses the Config.plist configuration where the App Name, URL String and Data Model names are
    ///
    /// - Returns: A Config object
    func parseConfig() -> Config {
        let url = Bundle.main.url(forResource: "Config", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(Config.self, from: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let config = parseConfig()
        print(config.appName)
        StorageManager.dataModel = config.dataModel
        
        fetchData()
        addCharacter()
    }
    
    func fetchData() {
        let fetchRequest = NSFetchRequest<TheWireCharacter>(entityName: "TheWireCharacter")
        do {
            let characters = try StorageManager.persistentContainer.viewContext.fetch(fetchRequest)
            self.characters = characters
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    func addCharacter() {
        let char1 = TheWireCharacter(context: StorageManager.persistentContainer.viewContext)
        
        char1.title = "test1"
        char1.is_favorite = false
        char1.text_description = "test111"
        
        characters.append(char1)
        
        StorageManager.saveContext()
    }
    
    @IBAction func Favorite(_ sender: UIButton) {
        var isFavorited: Bool = true
        
        
        if isFavorited == true {
            favoriteButton.setImage(UIImage(imageLiteralResourceName: "favoriteOn"), for: .normal)
            isFavorited = false
        }
        else {
            favoriteButton.setImage(UIImage(imageLiteralResourceName: "favoriteOff"), for: .normal)
            isFavorited = true
        }
        print("Favorited!")
    }
}
