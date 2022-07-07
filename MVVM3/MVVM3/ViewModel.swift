//
//  ViewModel.swift
//  MVVM3
//
//  Created by anna on 07.07.2022.
//

import Foundation


class ViewModel: NSObject {
    
    @IBOutlet weak var networkManager: NetworkManager!
    
    private var movies: [String]?
    
    func fetchMovies(complition: @escaping() -> ()) {
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            complition()
        }
    }
    
    func numberOFRows() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
    }
}
