//
//  ViewModel.swift
//  MVC-MVVM
//
//  Created by anna on 27.06.2022.
//

import Foundation


class ViewModel {
    
    private var model = Model(name: "Anna", lastname: "Gola", age: 23)
    
    var name: String {
        return model.name
    }
    var lastname: String {
        return model.lastname
    }
    var age: String {
        return String(describing: model.age)
    }
    
    private var profession = Profession(profi: "Pastry Chef", experience: 5, status: "unemploed")
    
    var profi: String {
        return profession.profi
    }
    var experience: String {
        return "\(profession.experience)"
    }
    var status: String {
        return profession.status
    }
    
}
