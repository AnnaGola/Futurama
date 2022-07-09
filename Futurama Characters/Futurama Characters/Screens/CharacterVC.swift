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
    
    var characterDetails: CharacterModel?
    var details: CharacterModel?
    var location = [CharacterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        details = characterDetails
        
        nameLabel.text = details?.name
        speciesLabel.text = details?.species.rawValue
        ageLabel.text = details?.age
        statusLabel.text = details?.status.rawValue
        professionLabel.text = details?.profession
        planetLabel.text = details?.planet.rawValue
        
        self.image.layer.cornerRadius = 15
        self.image.loadThumbnail(stringURL: details!.picURL)
    }
   

}
