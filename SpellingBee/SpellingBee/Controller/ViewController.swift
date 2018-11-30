//
//  ViewController.swift
//  SpellingBee
//
//  Created by Eric Hernandez on 11/30/18.
//  Copyright © 2018 Eric Hernandez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var spellTxt: UITextField!
    
    var questionNumber: Int = 0
    var randomPick: Int = 0
    
    let congratulateArray = ["Great Job", "Excellent", "Way to go", "Alright", "Right on", "Correct", "Well done", "Awesome"]
    let retryArray = ["Try again","Oooops"]
    let allWords = WordBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let firstWord = allWords.list[0].spellWord
        readMe(myText: "Spoull" + firstWord)
        
    }

    @IBAction func checkBtn(_ sender: Any) {
        
        let spellWord = allWords.list[questionNumber].spellWord
        
        if spellWord == spellTxt.text {
            //congratulate
            randomPositiveFeedback()
            
            //Wait 2 seconds before showing the next question
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when){
                //spell next word
                self.questionNumber += 1
                self.nextWord()
            }
    
            //clear texview
            spellTxt.text = ""
            
            
            //increment score
        }
        else {
            randomTryAgain()
        }
    }
    
    func readMe( myText: String) {
        let utterance = AVSpeechUtterance(string: myText )
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.3
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    
    func nextWord(){
        if questionNumber <= 2 {
            //wordLabel.text = allWords.list[questionNumber].spellWord
            readMe(myText: "Spoull" + allWords.list[questionNumber].spellWord)
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
    
    func randomPositiveFeedback(){
        randomPick = Int(arc4random_uniform(8))
        readMe(myText: congratulateArray[randomPick])

    }
    
    func randomTryAgain(){
        randomPick = Int(arc4random_uniform(2))
        readMe(myText: retryArray[randomPick])
    }
}

