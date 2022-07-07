//
//  TableViewCell.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    static var identifier = "Cell"
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.fullName
            ageLabel.text = viewModel.age
        }
    }
}
