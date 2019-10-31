//
//  ViewController.swift
//  News
//
//  Created by Vikhyath on 12/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class HomeViewController: BaseVC {
    
    @IBOutlet weak var collectionViewtopConstraint: NSLayoutConstraint!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var news: News?
    let newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
        newsCollectionView.setCollectionViewLayout(NewsCellLayout(), animated: false)
        navBar.setUpNavTitle(title: "News")
        
        collectionViewtopConstraint.constant = navigationBarHeight
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
    
    fileprivate func animateNavBar(_ scrollView: UIScrollView) {
        let disp = (scrollView.contentOffset.y + 40)
        print(disp)
        if disp <= 0 {
            self.navigationBarHeight = navBarActualHeight
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News")
            //navigationBarHeight = navBarActualHeight
            //collectionViewtopConstraint.constant = navigationBarHeight
        } else {
            self.navigationBarHeight = max(self.navigationBarHeight - disp, statusBarHeight)
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News", color: .white, shouldShow: false)
            //navigationBarHeight = max(navigationBarHeight - disp, statusBarHeight)
            //collectionViewtopConstraint.constant = navigationBarHeight
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        animateNavBar(scrollView)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
//       animateNavBar(scrollView)

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        animateNavBar(scrollView)
    }
}

