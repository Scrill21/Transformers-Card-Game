//
//  ChoiceViewController.swift
//  Transformers Card Game
//
//  Created by anthony byrd on 4/22/21.
//
//MARK: - Protocol
protocol ChoiceSelectionDelegate: AnyObject {
    func factionWasSelected(faction: String)
}

import UIKit
class ChoiceViewController: UIViewController {
    
    //MARK: - Properties
    weak var delegate: ChoiceSelectionDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func autobotsButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "autobots")
        self.dismiss(animated: true)
    }
    
    @IBAction func decepticonsButtonTapped(_ sender: Any) {
        delegate?.factionWasSelected(faction: "decepticons")
        self.dismiss(animated: true)
    }
    
}//End of class
