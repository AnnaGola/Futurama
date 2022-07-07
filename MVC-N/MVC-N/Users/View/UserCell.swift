//
//  UserCell.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    func configureUserCell(with user: User) {
        self.username.text = user.username
        self.name.text = user.name
        self.email.text = user.email
        self.address.text = user.address.city
    }
    
}
