//
//  Extensions.swift
//  News
//
//  Created by Vikhyath on 20/08/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func download(from link: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        
        guard let unwrappedUrl = link, let url = URL(string: unwrappedUrl) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

