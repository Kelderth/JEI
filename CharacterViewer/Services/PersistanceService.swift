//
//  PersistanceService.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//

import CoreData
import Foundation

class PersistenceService{
    
    private init() {
    }
    
    static var context: NSManagedObjectContext {
        print(persistentContainer.viewContext)
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TheWireDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
