//
//  TagsCollectionViewCell.swift
//  Example
//
//  Created by KubaRahmetMobile on 9/25/19.
//  Copyright © 2019 kuba. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 0.13, green: 0.71, blue: 0.45, alpha: 1.0).cgColor
    }
    
    func setupWith(tag: String, index: Int) {
        layer.cornerRadius = frame.height / 2
        textLabel.text = "\(tag) (\(index))"
    }
}
