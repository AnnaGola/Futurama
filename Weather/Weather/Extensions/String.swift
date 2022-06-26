//
//  String.swift
//  Weather
//
//  Created by anna on 26.06.2022.
//

import UIKit


extension String {
    
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
    
    func deletPrefix() -> String {
        let newString = self.components(separatedBy: "/")
        return newString[1]
    }
}
