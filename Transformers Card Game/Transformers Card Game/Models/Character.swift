//
//  Character.swift
//  Transformers Card Game
//
//  Created by anthony byrd on 4/22/21.
//

import UIKit

class Character {
    let characterName: String
    let characterImage: UIImage?
    let faction: String
    let uuid: String
    
    init(characterName: String, characterImage: UIImage?, faction: String, uuid: String = UUID().uuidString) {
        self.characterName = characterName
        self.characterImage = characterImage
        self.faction = faction
        self.uuid = uuid
    }
}//End of class

//MARK: - Extensions
extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}//End of extension
