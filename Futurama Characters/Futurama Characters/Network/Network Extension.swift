//
//  Network Extension.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadThumbnail(stringURL: String) {
        
        guard let url = URL(string: stringURL) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: stringURL as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        
        NetworkManager.downloadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: stringURL as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                self.image = UIImage(named: "noImage")
            }
        }

        
    }
    
    
    
}
