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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    fileprivate func configureCell() {
        
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 4
        backgroundColor = .white
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

}
