//
//  CardCollectionViewController.swift
//  Transformers Card Game
//
//  Created by anthony byrd on 4/22/21.
//

import UIKit


class CardCollectionViewController: UICollectionViewController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shuffleCharacters(faction: selectedFaction)
    }
    
    //MARK: - Properties
    var displayedCharacters: [Character] = []
    var targetedCharacter: Character?
    var selectedFaction = "autobots"
    
    //MARK: - Helper Methods
    func shuffleCharacters(faction: String) {
        if faction == "autobots" {
            let shuffledAutobots = CharacterController.autobots.shuffled()
            let autobotsGroup = shuffledAutobots.prefix(3)
            displayedCharacters = Array(autobotsGroup)
            targetedCharacter = CharacterController.decepticons.randomElement()
        } else {
            let shuffledDecepticons = CharacterController.decepticons.shuffled()
            let decepticonsGroup = shuffledDecepticons.prefix(3)
            displayedCharacters = Array(decepticonsGroup)
            targetedCharacter = CharacterController.autobots.randomElement()
        }
        updatedViews()
    }
    
    func updatedViews() {
        guard let character = targetedCharacter else {return}
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        self.title = "Find \(character.characterName)"
        collectionView.reloadData()
    }
    
    func newCharacterGroupAlert(character: Character) {
        let success = character == targetedCharacter
        let alertContoller = UIAlertController(title: success ? "Correct!" : "Sorry try again" , message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleCharacters(faction: self.selectedFaction)
        }
        
        alertContoller.addAction(doneAction)
        if success {
            alertContoller.addAction(shuffleAction)
        }
        
        present(alertContoller, animated: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterVC" {
            guard let destinationVC = segue.destination as? ChoiceViewController else {return}
            destinationVC.delegate = self
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
    
        let character = displayedCharacters[indexPath.row]
        cell.character = character
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayedCharacters[indexPath.row]
        newCharacterGroupAlert(character: character)
    }

}//End of class

//MARK: - Extension
extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2

        return CGSize(width: width - 20, height: width + 30)
    }
}//End of extension

extension CardCollectionViewController: ChoiceSelectionDelegate {
    func factionWasSelected(faction: String) {
        selectedFaction = faction
        shuffleCharacters(faction: faction)
    }
    
}//End of extension
