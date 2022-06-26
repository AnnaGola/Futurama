//
//  FetchData.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import Foundation


protocol FetchingData {
    
    func fetchData<T: Codable>(urlString: String, complitionHandler: @escaping (T?) -> Void)
}

class FetchData: FetchingData {
   
    func fetchData<T: Codable>(urlString: String, complitionHandler: @escaping (T?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    complitionHandler(response)
                }
            } catch let error as NSError{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
