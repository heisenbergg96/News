//
//  ViewController.swift
//  News
//
//  Created by Vikhyath on 12/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    var news: News?
    let newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
        newsCollectionView.setCollectionViewLayout(NewsCellLayout(), animated: false)
//        newsCollectionView.backgroundColor = .red
        newsViewModel.newsListViewModel.addObserver(fireNow: false) { [weak self] (_) in
            
            DispatchQueue.main.async {
                self?.newsCollectionView.reloadData()
            }
        }
    }
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(newsViewModel.newsListViewModel.value.count)
        return newsViewModel.newsListViewModel.value.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(viewModel: newsViewModel.newsListViewModel.value[indexPath.row])
        
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        CGSize(width: newsCollectionView.frame.width - 40, height: 350)
//    }
}

