//
//  TableViewController.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import UIKit

class TableViewController: UITableViewController {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserNetworkService.getUsers { response in
            self.users = response.users
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.configureUserCell(with: user)
        return cell
    }
}
