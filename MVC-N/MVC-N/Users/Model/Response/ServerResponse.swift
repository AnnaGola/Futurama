//
//  ServerResponse.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import Foundation

struct GetUserResponse {
    
    var users = [User]()
    
    init(json: Any) throws {
        guard let arrayOfUsers = json as? [JSON] else {
            throw NetworkError.noSuchURL
        }
        var users = [User]()
        for user in arrayOfUsers {
            guard let user = User(dict: user) else { continue }
            users.append(user)
        }
        self.users = users
    }
}

