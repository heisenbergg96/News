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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow(color: .black, opacity: 1, offSet: CGSize(width: 5, height: 5), radius: 5)
    }
    
    fileprivate func configureCell() {
        
        //layer.borderColor = UIColor.clear.cgColor
//        layer.cornerRadius = 4
        //contentView.layer.cornerRadius = 4
//        backgroundColor = .white
        //contentView.layer.masksToBounds = false
    }
    
    func setupCell(viewModel: Article?) {
        
        descriptionLabel.text = viewModel?.description
        dateLabel.text = viewModel?.publishedAt
        imageView.download(from: viewModel?.urlToImage)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        //setNeedsLayout()
        layoutIfNeeded()
        var frame = layoutAttributes.frame
        frame.size.height = descriptionLabel.frame.height + 230
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.borderWidth = 0
        layer.cornerRadius = 10
        layer.masksToBounds = false
        
    }
}
