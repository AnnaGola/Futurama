//
//  Model.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    let species: Species
    let age: String
    let planet: Planet
    let profession: String
    let status: Status
    let picURL: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case picURL = "PicUrl"
        case name = "Name"
    }
    
    enum Planet: String, Codable {
        case earth = "Earth"
        case unknown = "Unknown"
    }
    
    enum Species: String, Codable {
        case formerlyHumanCurrentlyHeadInJarPossibly = "Formerly: HumanCurrently: Head in Jar (possibly)"
        case human = "Human"
        case humanClone = "Human/Clone"
        case unknown = "Unknown"
    }
    
    enum Status: String, Codable {
        case alive = "Alive"
        case aliveLivesInUniverseGamma = "Alive (lives in Universe Gamma)"
        case deceased = "Deceased"
        case unknown = "Unknown"
    }
}

