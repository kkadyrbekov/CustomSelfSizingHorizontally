//
//  SelfSizingHorizontallyCustomLayout.swift
//  RahmetBusiness
//
//  Created by Kuba on 9/23/19.
//  Copyright © 2019 Chocofamily. All rights reserved.
//

import UIKit

public protocol SelfSizingHorizontallyCustomLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, widthForCellAtIndexPath indexPath: IndexPath) -> CGFloat
}

open class SelfSizingHorizontallyCustomLayout: UICollectionViewLayout {
    open weak var delegate: SelfSizingHorizontallyCustomLayoutDelegate?
    open var numberOfColumns = 2
    open var cellPadding: CGFloat = 6

    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentWidth: CGFloat = 0
    
    private var contentHeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.top + insets.bottom)
    }
    open override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    open override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else { return }
        
        let columnHeight = contentHeight / CGFloat(numberOfColumns)
        var yOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            yOffset.append(CGFloat(column) * columnHeight)
        }
        
        var column = 0
        var xOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let cellWidth = delegate?.collectionView(collectionView, widthForCellAtIndexPath: indexPath) ?? 180
            let width = cellPadding * 2 + cellWidth
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: width, height: columnHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[column] = xOffset[column] + width
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
