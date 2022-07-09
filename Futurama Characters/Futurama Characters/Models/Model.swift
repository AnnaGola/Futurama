//
//  Model.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [CharacterModel]
}

public struct CharacterModel: Decodable, Identifiable {
    public var id: Int
    public let species: Species
    public let age: String
    public let planet: Planet
    public let profession: String
    public let status: Status
    public let picURL: String
    public let name: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case picURL = "PicUrl"
        case name = "Name"
    }
    
    public enum Planet: String, Decodable {
        case earth = "Earth"
        case unknown = "Unknown"
    }
    
    public enum Species: String, Decodable {
        case formerlyHumanCurrentlyHeadInJarPossibly = "Formerly: HumanCurrently: Head in Jar (possibly)"
        case human = "Human"
        case humanClone = "Human/Clone"
        case unknown = "Unknown"
    }
    
    public enum Status: String, Decodable {
        case alive = "Alive"
        case aliveLivesInUniverseGamma = "Alive (lives in Universe Gamma)"
        case deceased = "Deceased"
        case unknown = "Unknown"
    }
}

