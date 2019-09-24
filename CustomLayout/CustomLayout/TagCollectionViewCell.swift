//
//  TagCollectionViewCell.swift
//  DynamicWidthHorizontally
//
//  Created by Kuba on 9/23/19.
//  Copyright © 2019 kuba. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 0.13, green: 0.71, blue: 0.45, alpha: 1.0).cgColor
    }

}
