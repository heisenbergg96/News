//
//  Article.swift
//  News
//
//  Created by Vikhyath on 12/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import Foundation

class News: Decodable {
    
    var articles: [Article] = []
    
    private enum RootCodingKeys: String, CodingKey {
        case articles
    }
    
    required init(from decoder: Decoder) throws {
        
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var articleContainer = try rootContainer.nestedUnkeyedContainer(forKey: .articles)
       
        while articleContainer.isAtEnd == false {
            
            guard let art = try articleContainer.decodeIfPresent(Article.self) else { return }
            articles.append(art)
        }
    }
}

class Source: Codable {
    
    var id: String
    var name: String
}

class Article: Codable {
    
    var source: Source
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
}
