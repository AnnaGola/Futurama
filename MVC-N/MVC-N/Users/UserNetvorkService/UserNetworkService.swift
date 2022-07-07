//
//  UserNetworkService.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import Foundation

class UserNetworkService {
    
    private init() {}
    
    static func getUsers(complition: @escaping(GetUserResponse) -> ()) {
        let urlString =  "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        NetworkService.shared.getData(url: url) { json in
            do {
                let response = try GetUserResponse(json: json)
                complition(response)
            } catch {
                print(NetworkError.nothingInResponse)
            }
        }
    }
}
