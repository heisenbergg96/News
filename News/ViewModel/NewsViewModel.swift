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
    
    init() {
        
        Service().fetchNews(country: .Australia) { [weak self] (error, news) in
            
            guard let articles = news?.articles else { return }
            self?.newsListViewModel.value = articles
            
        }
    }
}
