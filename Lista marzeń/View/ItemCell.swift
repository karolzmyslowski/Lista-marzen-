//
//  ItemCell.swift
//  Lista marzeń
//
//  Created by Karol Zmyslowski on 06.01.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configureCell(item: Item) {
    
        title.text = item.title
        price.text = "\(item.price) zł"
        details.text = item.details
    }
}
