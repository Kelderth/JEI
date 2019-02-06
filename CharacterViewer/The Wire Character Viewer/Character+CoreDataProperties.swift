//
//  Character+CoreDataProperties.swift
//  The Wire Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//
//

import Foundation
import CoreData


extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "Character")
    }

    @NSManaged public var title: String?
    @NSManaged public var text_description: String?
    @NSManaged public var urlImage: String?
    @NSManaged public var is_favorite: Bool

}
