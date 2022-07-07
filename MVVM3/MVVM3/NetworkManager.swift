//
//  NetworkManager.swift
//  MVVM3
//
//  Created by anna on 07.07.2022.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(complition: ([String]) -> ()) {
        
        let urlString = ""
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error != nil else { return }

            do {
                let json = try 
            } catch {
                print(error)
            }
        }
    }
}
