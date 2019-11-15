//
//  TwoPlayerViewController.swift
//  hangman_2
//
//  Created by Gregory Keeley on 11/14/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var beginGameButton: UIButton!
    @IBOutlet weak var mainGameLabel: UILabel!
    @IBOutlet weak var incorrectLettersLabel: UILabel!
    @IBOutlet weak var incorrectGuessCounter: UILabel!
    @IBOutlet weak var winOrLoseLabel: UILabel!
    @IBOutlet weak var mainASCiiLabel: UITextView!
    var newWord = String()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
    }
    
    // MARK: Actions
    @IBAction func newWordEntered(_ sender: UITextField) {
        newWord = sender.text ?? "Zeus"
        customWordUnderscores(sender.text ?? "Zeus")
    }
    
    @IBAction func beginGameButtonPressed(_ sender: UIButton) {
        beginGameButton.isHidden = true
        // beginGameButton.isEnabled = false
        resetGame()
        mainGameLabel.text = String(underscoresFromRandomWordTwoPlayer)
        incorrectGuessCounter.text = "0"
        incorrectLettersLabel.text = ("Tap \"Begin Game\" to start")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hangmanBrain(textField.text ?? "0")
        mainGameLabel.text = String(underscoresFromRandomWord)
        userInput.text = ""
        incorrectLettersLabel.text = lettersGuessed.uppercased()
        incorrectGuessCounter.text = String(guessCounter)
        
        if randomWord == (String(underscoresFromRandomWord)) {
            winOrLoseLabel.text = "WINNER!!!"
            beginGameButton.isHidden = false
            //  beginGameButton.isEnabled = true
            beginGameButton.setTitle("Tap here to play again", for: .normal)
        } else if guessCounter > 5 {
            winOrLoseLabel.text = "You lost..."
            beginGameButton.isHidden = false
            //   beginGameButton.isEnabled = true
            beginGameButton.setTitle("Tap here to play again", for: .normal)
            mainGameLabel.text = randomWord
        }
        switch guessCounter {
        case 0:
            mainASCiiLabel.text = hangManEmpty
        case 1:
            mainASCiiLabel.text = hangMan1
        case 2:
            mainASCiiLabel.text = hangMan2
        case 3:
            mainASCiiLabel.text = hangMan3
        case 4:
            mainASCiiLabel.text = hangMan4
        case 5:
            mainASCiiLabel.text = hangMan5
        case 6:
            mainASCiiLabel.text = hangManFinal
        default:
            mainASCiiLabel.text = hangManEmpty
        }
        return userInput.resignFirstResponder()
        
    }
    
}


