//
//  TableViewCellViewModel.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    var fullName: String {
        return profile.name + " " + profile.surname
    }
    
    var age: String {
        return String(profile.age)
    }
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
