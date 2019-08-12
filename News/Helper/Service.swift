//
//  Service.swift
//  News
//
//  Created by Vikhyath on 12/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import Foundation

enum Country: String {
    
    case India = "google-news-in"
    case Australia = "google-news-au"
    case UK = "google-news-uk"
    
}

class Service {
    
    func fetchNews(country: Country) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?sources=\(country.rawValue)&apiKey=785a243b336b4aa79fa788a0473699a5"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            
        }
    }
}
