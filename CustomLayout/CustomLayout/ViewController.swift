//
//  ViewController.swift
//  CustomLayout
//
//  Created by Kuba on 9/24/19.
//  Copyright © 2019 kuba. All rights reserved.
//

import UIKit
import CustomSelfSizingHorizontally

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tags = ["Eddard (Ned) Stark", "Jon Snow", "Jaime Lannister", "Catelyn Stark", "Cersei Lannister", "Daenerys Targaryen", "Jorah Mormont", "Viserys Targaryen", "Robert Baratheon", "Sansa Stark", "Arya Stark", "Robb Stark", "Theon Greyjoy", "Bran Stark", "Joffrey Baratheon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        let layout = SelfSizingHorizontallyCustomLayout()
        layout.numberOfColumns = 2
        layout.cellPadding = 6.0
        layout.delegate = self
        collectionView.collectionViewLayout = layout
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        cell.textLabel.text = "\(tags[indexPath.row]) (\(indexPath.row))"
        return cell
    }
}

extension ViewController: SelfSizingHorizontallyCustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, widthForCellAtIndexPath indexPath:IndexPath) -> CGFloat {
        let text = "\(tags[indexPath.row]) (\(indexPath.row))"
        let size: CGSize = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)])
        return size.width + 80
    }
}

