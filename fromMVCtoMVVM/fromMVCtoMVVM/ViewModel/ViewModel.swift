//
//  ViewModel.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    var profiles = [
    Profile(name: "Anna", surname: "Gola", age: 23),
    Profile(name: "Kseniya", surname: "Syslina", age: 26)]
    
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
            let profile = profiles[indexPath.row]
        
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
        
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
        

}
