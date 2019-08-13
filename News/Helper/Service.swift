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
    
    func fetchNews(country: Country, completionHandler: @escaping (Error?, News?) -> Void) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?sources=\(country.rawValue)&apiKey=785a243b336b4aa79fa788a0473699a5"
        
        guard let url = URL(string: urlString) else {
            completionHandler(NewsError.urlError, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                completionHandler(NewsError.networkUnavailable, nil)
                return
            }
            
            guard let data = data else {
                completionHandler(NewsError.networkUnavailable, nil)
                return
            }
            
            do {
                // Decode the JSON into codable type GeoJSON.
                let decoder = JSONDecoder()
                let news = try decoder.decode(News.self, from: data)
                completionHandler(nil, news)
                return
                
            } catch {

                // Alert the user if data cannot be digested.
                completionHandler(NewsError.wrongDataFormat, nil)
                return
            }
        }
        
        task.resume()
    }
}
