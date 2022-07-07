//
//  Model.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import Foundation

public struct CharacterModel: Codable {
    public let species: Species
    public let age: String
    public let planet: Planet
    public let profession: String
    public let status: Status
    public let picURL: String

    enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case picURL = "PicUrl"
    }
}

public enum Planet: String, Codable {
    case earth = "Earth"
    case unknown = "Unknown"
}

public enum Species: String, Codable {
    case formerlyHumanCurrentlyHeadInJarPossibly = "Formerly: HumanCurrently: Head in Jar (possibly)"
    case human = "Human"
    case humanClone = "Human/Clone"
    case unknown = "Unknown"
}

public enum Status: String, Codable {
    case alive = "Alive"
    case aliveLivesInUniverseGamma = "Alive (lives in Universe Gamma)"
    case deceased = "Deceased"
    case unknown = "Unknown"
}

