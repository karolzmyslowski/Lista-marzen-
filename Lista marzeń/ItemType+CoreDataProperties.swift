//
//  ItemType+CoreDataProperties.swift
//  Lista marzeń
//
//  Created by Karol Zmyslowski on 06.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
