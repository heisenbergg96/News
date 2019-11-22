//
//  FilterCollectionView.swift
//  News
//
//  Created by Vikhyath on 04/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit


protocol FilterViewDelegate: class {
    
    func filterView(filterView: FilterCollectionView, didSelect index: Int)
}

protocol FilterViewDataSource: class {
    
    func filterView(numberOfItemsin filterView: FilterCollectionView) -> Int
    func filterView(filterView: FilterCollectionView, filterStringAtIndex: Int) -> Filter
}

class FilterCollectionView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
        
    @IBOutlet weak var filterView: UICollectionView!
    
    weak var delegate: FilterViewDelegate?
    weak var dataSource: FilterViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        filterView.register(FilterCell.self)
        filterView.delegate = self
        filterView.dataSource = self
        filterView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        filterView.setCollectionViewLayout(NewsCellLayout(), animated: true)
        if let layout = filterView.collectionViewLayout as? NewsCellLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
        }
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource?.filterView(numberOfItemsin: self) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.setupCell(viewModel: dataSource?.filterView(filterView: self, filterStringAtIndex: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: collectionView.frame.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.filterView(filterView: self, didSelect: indexPath.row)
    }
    
}
