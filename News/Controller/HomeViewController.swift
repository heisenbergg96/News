//
//  ViewController.swift
//  News
//
//  Created by Vikhyath on 12/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Service().fetchNews(country: .UK) { (error, news) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            news?.articles.forEach({ (article) in
                
                
            })
        }
    }

    
}

