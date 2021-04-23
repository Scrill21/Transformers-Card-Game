//
//  CharacterController.swift
//  Transformers Card Game
//
//  Created by anthony byrd on 4/22/21.
//

import UIKit

class CharacterController {
    
    static let autobots = [
        Character(characterName: "Optimus Prime", characterImage: UIImage(named: "optimusprime"), faction: "autobots"),
        Character(characterName: "Bumblebee", characterImage: UIImage(named: "bumblebee"), faction: "autobots"),
        Character(characterName: "Ratchet", characterImage: UIImage(named: "ratchet"), faction: "autobots"),
        Character(characterName: "Ironhide", characterImage: UIImage(named: "ironhide"), faction: "autobots"),
        Character(characterName: "Jazz", characterImage: UIImage(named: "jazz"), faction: "autobots"),
        Character(characterName: "Starscream", characterImage: UIImage(named: "starscream"), faction: "autobots")
    ]
    
    static let decepticons = [
        Character(characterName: "Megatron", characterImage: UIImage(named: "megatron"), faction: "decepticons"),
        Character(characterName: "Frenzy", characterImage: UIImage(named: "frenzy"), faction: "decepticons"),
        Character(characterName: "Bonecrusher", characterImage: UIImage(named: "bonecrusher"), faction: "decepticons"),
        Character(characterName: "Barricade", characterImage: UIImage(named: "barricade"), faction: "decepticons"),
        Character(characterName: "Blackout", characterImage: UIImage(named: "blackout"), faction: "decepticons"),
        Character(characterName: "Scorponok", characterImage: UIImage(named: "scorponok"), faction: "decepticons")
    ]
}//End of class
