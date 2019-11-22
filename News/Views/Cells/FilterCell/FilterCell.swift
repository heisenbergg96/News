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
    var padding: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterImageView.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var isSelected: Bool {
        
        didSet {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.filterLabel.textColor = self.isSelected ? .black : .lightGray
            }, completion: nil)
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        //setNeedsLayout()
        layoutIfNeeded()
        var frame = layoutAttributes.frame
        var imageViewWidth: CGFloat = 2 * padding
        if !filterImageView.isHidden {
            imageViewWidth = filterImageView.frame.width + 3 * padding
        }
        frame.size.width = filterLabel.frame.width + imageViewWidth
        layoutAttributes.frame = frame
        
        
        return layoutAttributes
    }
    
    
    func setupCell(viewModel: Filter?) {

        filterLabel.text = viewModel?.filterString.description
        isSelected = viewModel?.isSelected ?? false
    }
    
}
