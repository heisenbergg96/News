//
//  NewsFlowLayout.swift
//  News
//
//  Created by Vikhyath on 30/10/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class NewsCellLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        minimumLineSpacing = 40
        estimatedItemSize = CGSize(width: collectionView?.frame.width ?? UIScreen.main.bounds.width - 40, height: 400)
        collectionView?.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

