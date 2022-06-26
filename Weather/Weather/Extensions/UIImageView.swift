//
//  UIImageView.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import UIKit

extension UIImageView {
    
    func getImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode == 200,
                  let type = response?.mimeType,
                  type.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    func downloadedData(from link: String, comtemtMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        guard let url = URL(string: link) else { return }
        getImage(from: url, contentMode: mode)
    }
}
