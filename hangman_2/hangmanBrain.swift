//
//  hangmanBrain.swift
//  hangman_2
//
//  Created by Gregory Keeley on 11/14/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit



var randomWord = words.randomElement()?.lowercased() ?? "Error"
var customWord = String()

var underscoresFromRandomWord:[Character] = Array(String(repeating: "_", count: randomWord.count))
var underscoresFromRandomWordTwoPlayer: [Character] = Array(String(repeating: "_", count: customWord.count))

var hiddenWord = String(underscoresFromRandomWord)
var maxGuesses = 5
var guessCounter = 0
var lettersGuessed = ""
var repeatCondition = true
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var indices = [Int]()
var totalGuesses = (0)
var correctGuess = ""
var winWord = ""

var viewcontroller1 = SinglePlayerViewController()
var viewcontroller2 = TwoPlayerViewController()

// MARK: Funcs
func resetGame() -> () {
    randomWord = words.randomElement()?.lowercased() ?? "ERROR"
    underscoresFromRandomWord = Array(String(repeating: "_ ", count: randomWord.count))
    lettersGuessed = ""
    guessCounter = 0
}

func customWordUnderscores(_ userInput: String) {
    for (index, _) in underscoresFromRandomWordTwoPlayer.enumerated() {
        if indices.contains(index) {
            underscoresFromRandomWordTwoPlayer[index] = Character(userInput)
        }
    }
}

func hangmanBrain(_ userInput: String) {
    if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) {
        print("valid character was not entered")
    } else if randomWord.contains(userInput) {
        for (index, char) in randomWord.enumerated() {
            if userInput.contains(char) {
                indices.append(index)
                correctGuess.append(userInput)
                winWord.append(userInput)
            }
        }
        for (index, _) in underscoresFromRandomWord.enumerated() {
            if indices.contains(index) {
                underscoresFromRandomWord[index] = Character(userInput)
            }
        }
        indices.removeAll()
    }
    if !randomWord.contains(userInput) {
        guessCounter += 1
        lettersGuessed.append(userInput + " ")
        totalGuesses += 1
        print(guessCounter)
        print(randomWord)
    }
}
func hangmanBrain2(_ userInput: String) {
    if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) {
        print("valid character was not entered")
    } else if customWord.contains(userInput) {
        for (index, char) in customWord.enumerated() {
            if userInput.contains(char) {
                indices.append(index)
                correctGuess.append(userInput)
                winWord.append(userInput)
            }
        }
        for (index, _) in underscoresFromRandomWordTwoPlayer.enumerated() {
            if indices.contains(index) {
                underscoresFromRandomWordTwoPlayer[index] = Character(userInput)
            }
        }
        indices.removeAll()
    }
    if !customWord.contains(userInput) {
        guessCounter += 1
        lettersGuessed.append(userInput + " ")
        totalGuesses += 1
    }
}
//func changeImage() {
//    switch guessCounter {
//    case 0:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang1")
//    case 1:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang2")
//    case 2:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang3")
//    case 3:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang4")
//    case 4:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang5")
//    case 5:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang6")
//    case 6:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang7")
//    default:
//        viewcontroller.mainImage.image = #imageLiteral(resourceName: "hang1")
//    }
//}

//func winCheck() {
//    if randomWord == (String(underscoresFromRandomWord)) {
//        viewcontroller.winOrLoseLabel.text = "WINNER!!!"
//        viewcontroller.beginGameButton.isEnabled = true
//        viewcontroller.beginGameButton.setTitle("Tap here to play again", for: .normal)
//    } else {
//        viewcontroller.winOrLoseLabel.text = "You lost..."
//        viewcontroller.beginGameButton.setTitle("Tap here to play again", for: .normal)
//        viewcontroller.mainGameLabel.text = randomWord
//    }
//}







//repeat {
/*
 if randomWord == (String(underscoresFromRandomWord)) {
 let losePrompt = readLine()?.lowercased() ?? "no"
 if losePrompt == "yes" {
 resetGame()
 } else {
 //       break
 }
 }
 print("Enter your character here:", terminator: " ")
 
 /* MOVED TO hangmanBrain func
 if userInput.count > 1 || !alphabet.contains(userInput) || correctGuess.contains(userInput) || lettersGuessed.contains(userInput) {
 print("please try again")
 }
 */
 
 if randomWord.contains(userInput) {
 for (index, char) in randomWord.enumerated() {
 if userInput.contains(char) {
 indices.append(index)
 correctGuess.append(userInput)
 winWord.append(userInput)
 }
 }
 for (index, _) in underscoresFromRandomWord.enumerated() {
 if indices.contains(index) {
 underscoresFromRandomWord[index] = Character(userInput)
 }
 }
 indices.removeAll()
 }
 if !randomWord.contains(userInput) {
 guessCounter += 1
 lettersGuessed.append(userInput + ", ")
 totalGuesses += 1
 }
 
 
 if guessCounter > maxGuesses {
 print(hangManFinal)
 print("You lost! The man has been hung")
 print("It took you \(totalGuesses) guesses to complete")
 print("The word was \"\(randomWord)\"")
 print("Would you like to play again?")
 let losePrompt = readLine()?.lowercased() ?? "no"
 if losePrompt == "yes" {
 resetGame()
 } else {
 print("Goodbye!")
 //   break
 }
 }
 
 switch guessCounter {
 case 0:
 print(hangManEmpty)
 case 1:
 
 print(hangMan1)
 case 2:
 
 print(hangMan2)
 case 3:
 
 print(hangMan3)
 case 4:
 
 print(hangMan4)
 case 5:
 
 print(hangMan5)
 case 6:
 
 print(hangManFinal)
 default:
 print()
 }
 
 
 if randomWord.contains(userInput) {
 print("You made a correct guess!")
 } else {
 print("Incorrect guess, try again")
 }
 print("Incorrect letters guessed: \(lettersGuessed)")
 print("Current progress: \(String(underscoresFromRandomWord))")
 //    } while repeatCondition
 }
 
 */
