//
//  CharacterCollectionViewCell.swift
//  Transformers Card Game
//
//  Created by anthony byrd on 4/22/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    
    //MARK: - Properties
    var character: Character? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let character = character else {return}
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.image = character.characterImage
    }
}//End of class
