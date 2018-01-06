//
//  Item.swift
//  Lista marzeń
//
//  Created by Karol Zmyslowski on 06.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate() as Date
    }
}
