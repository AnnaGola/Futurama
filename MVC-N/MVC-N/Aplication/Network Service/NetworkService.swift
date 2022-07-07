//
//  NetworkService.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import Foundation

class NetworkService {
    
    private init() {}
        
    static let shared = NetworkService()
    
    public func getData(url: URL, complition: @escaping (Any) -> ()) {
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    complition(json)
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
        
    
}