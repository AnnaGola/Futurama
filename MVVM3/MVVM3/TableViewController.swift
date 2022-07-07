//
//  TableViewController.swift
//  MVVM3
//
//  Created by anna on 07.07.2022.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOFRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.titleForCell(atIndexPath: indexPath)
        return cell
    }
    
}
