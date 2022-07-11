//
//  Model.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import Foundation


public struct CharacterModel: Decodable {
    public let species: String
    public let age: String
    public let planet: String
    public let profession: String
    public let status: String
    public let picURL: String
    public let name: String
    
    public enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case picURL = "PicUrl"
        case name = "Name"
    }
}

