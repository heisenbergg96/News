//
//  FilterCell.swift
//  News
//
//  Created by Vikhyath on 04/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class FilterCell: UICollectionViewCell, NibLoadableView {
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .white
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterImageView.backgroundColor = .red
        filterImageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
