//
//  ViewController.swift
//  MVC-MVVM
//
//  Created by anna on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var age: UILabel!
    
    var viewModel: ViewModel! {
        didSet {
            self.name.text = viewModel.profi
            self.lastName.text = viewModel.status
            self.age.text = viewModel.experience
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
    }
}

