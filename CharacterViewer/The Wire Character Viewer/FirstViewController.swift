//
//  FirstViewController.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    var characters = [TheWireCharacter]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(PersistenceService.context)
        
        let fetchRequest = NSFetchRequest<TheWireCharacter>(entityName: "TheWireCharacter")

        do{
            let characters = try PersistenceService.context.fetch(fetchRequest)
            self.characters = characters
            //self.tableView.reloadData()
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        addCharacter()
    }
    
    func addCharacter() {
                let char1 = TheWireCharacter(context: PersistenceService.context)
        
                char1.title = "test1"
                char1.is_favorite = false
                char1.text_description = "test111"
        
                characters.append(char1)
        
                PersistenceService.saveContext()
    }


}

