//
//  ViewController.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.label.text = viewModel.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.age.binding { [unowned self] in
            guard let string = $0 else { return }
            self.label.text = string
        }
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "5"
        }
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
}
