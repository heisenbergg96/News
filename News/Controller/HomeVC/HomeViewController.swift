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
    @IBOutlet weak var filterCollectionViewContainer: UIView!
    
    var news: News?
    let newsViewModel = NewsViewModel()
    let filterLayout = UICollectionViewFlowLayout()
    let filterCollectionView = FilterView()
    var filterView = FilterCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setviews()
        newsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        newsCollectionView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
        newsCollectionView.setCollectionViewLayout(NewsCellLayout(), animated: false)
        navBar.setUpNavTitle(title: "News")
        navBar.addshadow(offSet: CGSize(width: 0, height: 5))
        collectionViewtopConstraint.constant = navigationBarHeight
        newsViewModel.newsListViewModel.addObserver(fireNow: false) { [weak self] (_) in
            
            DispatchQueue.main.async {
                self?.newsCollectionView.reloadData()
            }
        }
        
    }
    
    func setviews() {
        
        guard let filview = FilterCollectionView.instanceFromNib() as? FilterCollectionView else { return }
        filterView = filview
        
        filterCollectionViewContainer.addSubview(filterView)
        filterView.frame = filterCollectionViewContainer.bounds
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModel.newsListViewModel.value.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setupCell(viewModel: newsViewModel.newsListViewModel.value[indexPath.row])
        return cell
    }
    
    fileprivate func animateNavBar(_ scrollView: UIScrollView) {
        let disp = (scrollView.contentOffset.y + 40)
        if disp <= 0 {
            self.navigationBarHeight = navBarActualHeight
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News")
        } else {
            self.navigationBarHeight = max(self.navigationBarHeight - disp, statusBarHeight)
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News", color: .white, shouldShow: false)

        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        animateNavBar(scrollView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select")
    }
}

