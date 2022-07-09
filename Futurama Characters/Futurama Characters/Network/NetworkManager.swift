//
//  NetworkManager.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import UIKit

public enum Result<Data> {
    case failure(Error)
    case success(Data)
}

final class NetworkManager: NSObject {
    
    private static func getData(url: URL, complition: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url, completionHandler: complition).resume()
    }
    
    public static func downloadImage(url: URL, complition: @escaping (Result<Data>) -> Void) {
        
        NetworkManager.getData(url: url) { data, response, error in
            
            if let error = error {
                complition(.failure(error))
                return
            }
            
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                complition(.success(data))
            }
        }
    }
}
