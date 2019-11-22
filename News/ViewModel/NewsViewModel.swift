//
//  NewsViewModel.swift
//  News
//
//  Created by Vikhyath on 20/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    var newsListViewModel = Observable<[Article]>(value: [])
    var filterItems: [Filter] = []
    
    func fetchNews(type: Country) {
        
        Service().fetchNews(country: type) { [weak self] (error, news) in
            
            guard let articles = news?.articles else { return }
            self?.newsListViewModel.value.removeAll()
            self?.newsListViewModel.value = articles
            
        }
    }
    
    func fetchFilterContent() {
        
        let array = [Filter(isSelected: true, filterString: .Australia), Filter(isSelected: false, filterString: .India), Filter(isSelected: false, filterString: .UK)]
        filterItems.append(contentsOf: array)
    }
    
}
