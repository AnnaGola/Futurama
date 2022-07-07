//
//  ModelUsers.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import Foundation

struct User {
    var name: String
    var username: String
    var email: String
    var address: Adress
    
    init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
              let username = dict["username"] as? String,
              let email = dict["email"] as? String,
              let address = dict["address"] as? Adress
        else { return nil }
        
        self.email = email
        self.name = name
        self.address = address
        self.username = username
    }
}

struct Adress {
    var street: String
    var city: String
    
    
    init?(dict: [String: String]) {
        guard let street = dict["street"],
              let city = dict["city"]
        else { return nil }
        
        self.street = street
        self.city = city
    }
}
