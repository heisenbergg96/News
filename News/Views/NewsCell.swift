//
//  NewsCell.swift
//  News
//
//  Created by Vikhyath on 13/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var article: Article?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow(color: .black, opacity: 1, offSet: CGSize(width: 20, height: 20), radius: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        dropShadow(color: .black, opacity: 1, offSet: CGSize(width: 20, height: 20), radius: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dropShadow(color: .black, opacity: 1, offSet: CGSize(width: 20, height: 20), radius: 20)
    }
    
    fileprivate func configureCell() {
        
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 6
        backgroundColor = .white
    }
    
    func setupCell(viewModel: Article?) {
        
        descriptionLabel.text = viewModel?.title
        dateLabel.text = viewModel?.publishedAt
    }
    
    func dropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        setNeedsLayout()
        layoutIfNeeded()
        var frame = layoutAttributes.frame
        frame.size.height = descriptionLabel.frame.height + 230
        layoutAttributes.frame = frame
        
        
        return layoutAttributes
    }
}
