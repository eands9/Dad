//
//  ViewController.swift
//  SpellingBee
//
//  Created by Eric Hernandez on 11/30/18.
//  Copyright © 2018 Eric Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var spellTxt: UITextField!
    
    var questionNumber: Int = 0
    
    let allWords = WordBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let firstWord = allWords.list[0].spellWord
        wordLabel.text = firstWord
        
    }

    @IBAction func checkBtn(_ sender: Any) {
        if wordLabel.text == spellTxt.text {
            print("Great Job!")
            
            
            //spell next word
            questionNumber += 1
            nextWord()
            
            //increment score
        }
        else {
            print("Try Again...")
        }
    }
    
    func nextWord(){
        if questionNumber <= 2 {
            wordLabel.text = allWords.list[questionNumber].spellWord
        }
        else {
            
            //If on the last question, alert user if they want to start over
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    func startOver(){
        questionNumber = 0
        nextWord()
    }
}

