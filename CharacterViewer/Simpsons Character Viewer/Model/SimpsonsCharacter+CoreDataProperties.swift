//
//  SimpsonsCharacter+CoreDataProperties.swift
//  Simpsons Character Viewer
//
//  Created by Isai Yepez on 2/6/19.
//  Copyright © 2019 Isai Yepez. All rights reserved.
//
//

import Foundation
import CoreData


extension SimpsonsCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SimpsonsCharacter> {
        return NSFetchRequest<SimpsonsCharacter>(entityName: "SimpsonsCharacter")
    }

    @NSManaged public var is_favorite: Bool
    @NSManaged public var text_description: String?
    @NSManaged public var title: String?
    @NSManaged public var url_image: String?

}
