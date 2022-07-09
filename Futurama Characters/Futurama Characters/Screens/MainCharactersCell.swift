//
//  MainCharactersCell.swift
//  Futurama Characters
//
//  Created by anna on 07.07.2022.
//

import UIKit

class MainCharactersCell: UITableViewCell {

    static let identifier = "Cell"
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameOfCharacter: UILabel!
    @IBOutlet weak var speciesOfCharacter: UILabel!
    @IBOutlet weak var professionOfCharacter: UILabel!
    @IBOutlet weak var imageOfCharacter: UIImageView!
    
    func configure(character: CharacterModel) {
        self.nameOfCharacter.text = character.name
        self.speciesOfCharacter.text = String(describing: character.species)
        self.professionOfCharacter.text = character.profession
        self.imageOfCharacter.loadThumbnail(stringURL: character.picURL)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOpacity = 0.2
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowRadius = 10
        cellView.layer.cornerRadius = 15
        imageOfCharacter.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
