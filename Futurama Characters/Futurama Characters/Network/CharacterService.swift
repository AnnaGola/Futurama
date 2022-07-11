//
//  CharacterService.swift
//  Futurama Characters
//
//  Created by anna on 09.07.2022.
//

import Foundation

final class CharacterService {
    
    func getCharacters(stringURL: String, complition: @escaping (ViewModel) -> ()) {
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, response != nil, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode([CharacterModel].self, from: data)
                let viewModel = ViewModel()

                viewModel.characters = characters
                
                DispatchQueue.main.async {
                    complition(viewModel)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
