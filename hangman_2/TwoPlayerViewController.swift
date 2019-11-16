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
    @IBOutlet weak var enterWordTextField: UITextField!
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
        enterWordTextField.delegate = self
        
        //MARK: Disabling elements on load
        beginGame()
    }
    
    // MARK: Actions and funcs
    @IBAction func newWordEntered(_ sender: UITextField) {
        newWord = sender.text ?? "Zeus"
        customWordUnderscores(sender.text ?? "Zeus")
    }
    
    @IBAction func beginGameButtonPressed(_ sender: UIButton) {
        beginGameButton.isHidden = true
        beginGame()
        resetGame()
        //Move to return on enterTextField to begin game
        incorrectGuessCounter.text = "0"
        incorrectLettersLabel.text = ("")
    }
    
    func beginGame() {
        userInput.isHidden = true
        incorrectGuessCounter.isHidden = true
        mainASCiiLabel.isHidden = true
        winOrLoseLabel.isHidden = true
        beginGameButton.isHidden = true
        enterWordTextField.text = ""
        enterWordTextField.isHidden = false
        customWord = ""
        newWord = ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == enterWordTextField {
            newWord = enterWordTextField.text ?? "Hello"
            customWord = newWord
            customWordUnderscores(customWord)
            
            enterWordTextField.isHidden = true
            userInput.isHidden = false
            incorrectGuessCounter.isHidden = false
            mainASCiiLabel.isHidden = false
            winOrLoseLabel.isHidden = false
            
            mainGameLabel.text = String(underscoresFromRandomWordTwoPlayer)
            incorrectGuessCounter.text = "0"
            incorrectLettersLabel.text = ("")
            textField.resignFirstResponder()
            
        } else if textField == userInput {
            hangmanBrain2(textField.text ?? "0")
            mainGameLabel.text = String(underscoresFromRandomWordTwoPlayer + " ")
            userInput.text = ""
            incorrectLettersLabel.text = lettersGuessed.uppercased()
            incorrectGuessCounter.text = String(guessCounter)
            if customWord == (String(underscoresFromRandomWordTwoPlayer)) {
                winOrLoseLabel.text = "WINNER!!!"
                beginGameButton.isHidden = false
                beginGameButton.setTitle("Tap here to play again", for: .normal)
                underscoresFromRandomWordTwoPlayer.removeAll()
            } else if incorrectGuessCounter.text == "6" {
                winOrLoseLabel.text = "You lost..."
                beginGameButton.isHidden = false
                beginGameButton.setTitle("Tap here to play again", for: .normal)
                mainGameLabel.text = newWord
                underscoresFromRandomWordTwoPlayer.removeAll()
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
        }
        return userInput.resignFirstResponder()
    }
}


