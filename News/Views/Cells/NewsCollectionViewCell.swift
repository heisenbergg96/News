//
//  NewsCollectionViewCell.swift
//  News
//
//  Created by Vikhyath on 31/10/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

//
//  NewsCell.swift
//  News
//
//  Created by Vikhyath on 13/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var article: Article?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dropShadow1(color: .black, opacity: 1, offSet: CGSize(width: 5, height: 5), radius: 5)
    }
    
    func setupCell(viewModel: Article?) {
        
        titleLabel.text = viewModel?.description
        publishedDateLabel.text = viewModel?.publishedAt
        imageView.download(from: viewModel?.urlToImage)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        //setNeedsLayout()
        layoutIfNeeded()
        var frame = layoutAttributes.frame
        frame.size.height = titleLabel.frame.height + 230
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func dropShadow1(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.borderWidth = 0
        backgroundColor = .clear
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
}
