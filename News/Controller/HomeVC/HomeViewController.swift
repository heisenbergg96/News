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
        newsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        newsCollectionView.setCollectionViewLayout(NewsCellLayout(), animated: false)
        navBar.setUpNavTitle(title: "News")
        filterCollectionViewContainer.dropShadow2(color: .darkGray, opacity: 0, offSet: CGSize(width: 0, height: 15))
        collectionViewtopConstraint.constant = navigationBarHeight
        newsViewModel.newsListViewModel.addObserver(fireNow: false) { [weak self] (_) in
            
            DispatchQueue.main.async {
                self?.newsCollectionView.reloadData()
            }
        }
        newsViewModel.fetchFilterContent()
        newsViewModel.fetchNews(type: .India)
    }
    
    func setviews() {
        
        guard let filview = FilterCollectionView.instanceFromNib() as? FilterCollectionView else { return }
        filterView = filview
        filterView.dataSource = self
        filterView.delegate = self
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
        
        let disp = scrollView.contentOffset.y
        if disp <= 0 {
            self.navigationBarHeight = navBarActualHeight
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News")
        } else {
            self.navigationBarHeight = max(self.navigationBarHeight - disp, statusBarHeight)
            self.collectionViewtopConstraint.constant = self.navigationBarHeight
            navBar.setUpNavTitle(title: "News", color: .white, shouldShow: false)
        }
        filterCollectionViewContainer.isShadowHidden = disp <= 0.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        animateNavBar(scrollView)
        let disp = scrollView.contentOffset.y
        print(disp)
    }
    
}

extension HomeViewController: FilterViewDataSource, FilterViewDelegate {
    
    func filterView(filterView: FilterCollectionView, didSelect index: Int) {
        
        newsViewModel.fetchNews(type: newsViewModel.filterItems[index].filterString)
    }
    
    func filterView(numberOfItemsin filterView: FilterCollectionView) -> Int {
        
        return newsViewModel.filterItems.count
    }
    
    func filterView(filterView: FilterCollectionView, filterStringAtIndex: Int) -> Filter {
        
        return newsViewModel.filterItems[filterStringAtIndex]
    }

}
