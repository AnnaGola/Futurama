//
//  DetailViewModel.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    var age: Box<String?> = Box(nil)
    
    var description: String {
        return String(describing: "\(profile.name) \(profile.surname) is \(profile.age) years old")
    }
}
