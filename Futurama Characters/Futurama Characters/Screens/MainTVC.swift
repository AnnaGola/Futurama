//
//  MainTVC.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import UIKit

class MainTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ViewModel?
    var characterService = CharacterService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterService.getCharacters(stringURL: API.apiURL) { viewModel in
            self.viewModel = viewModel
            self.tableView.reloadData()
        }
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCharactersCell.identifier) as? MainCharactersCell else { return UITableViewCell() }
        
        guard let character = viewModel?.characters[indexPath.row] else { return cell }
        cell.configure(character: character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowDetail", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CharacterVC else { return }
        
        let character = viewModel?.characters[(tableView.indexPathForSelectedRow?.row)!]
        
        destination.characterDetails = character
    }
}
