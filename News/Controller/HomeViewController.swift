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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCollectionView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 20, right: 20)
        newsCollectionView.setCollectionViewLayout(NewsCellLayout(), animated: false)
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        newsCollectionView.backgroundColor = UIColor(red: 214/255, green: 219/255, blue: 240/255, alpha: 1)
        Service().fetchNews(country: .UK) { [weak self] (error, news) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            self?.news = news
            DispatchQueue.main.async {
                self?.newsCollectionView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return news?.articles.count ?? 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(viewModel: news?.articles[indexPath.row])
        return cell
    }
    
}

