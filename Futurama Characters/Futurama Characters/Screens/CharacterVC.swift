//
//  CharacterVC.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import UIKit

class CharacterVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!

    var details: CharacterModel?
    var characterDetails: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = details?.name
        speciesLabel.text = String(describing: details?.species)
        ageLabel.text = details?.age
        statusLabel.text = String(describing: details?.status)
        professionLabel.text = details?.profession
        planetLabel.text = String(describing: details?.planet)
        
        self.image.layer.cornerRadius = 15
        self.image.loadThumbnail(stringURL: details!.picURL)
    }
}
