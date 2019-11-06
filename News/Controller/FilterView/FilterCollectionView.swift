//
//  FilterCollectionView.swift
//  News
//
//  Created by Vikhyath on 04/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class FilterCollectionView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
        
    @IBOutlet weak var filterView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        filterView.register(FilterCell.self)
        filterView.delegate = self
        filterView.dataSource = self
        filterView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.filterLabel.text = "sdfjhg"
        cell.filterImageView.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: collectionView.frame.height - 16)
    }
    
}
