//
//  ViewController.swift
//  PrimePrep
//
//  Created by Cassidy Wang on 10/17/15.
//  Copyright © 2015 Cassidy Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sentences = [[[String]]]()
    var score = 0
    var sentenceCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateSentences()
        shuffleSentences()
        setup()
        scoreCounter.adjustsFontSizeToFitWidth = true
        scoreCounter.text = "Score: \(score)"
        input1.titleLabel?.adjustsFontSizeToFitWidth = true
        input2.titleLabel?.adjustsFontSizeToFitWidth = true
        input3.titleLabel?.adjustsFontSizeToFitWidth = true
        input4.titleLabel?.adjustsFontSizeToFitWidth = true
        input5.titleLabel?.adjustsFontSizeToFitWidth = true
        input6.titleLabel?.adjustsFontSizeToFitWidth = true
        display1.titleLabel?.adjustsFontSizeToFitWidth = true
        display2.titleLabel?.adjustsFontSizeToFitWidth = true
        display3.titleLabel?.adjustsFontSizeToFitWidth = true
        display4.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display1: UIButton!
    @IBOutlet weak var display2: UIButton!
    @IBOutlet weak var display3: UIButton!
    @IBOutlet weak var display4: UIButton!
    @IBOutlet weak var input1: UIButton!
    @IBOutlet weak var input2: UIButton!
    @IBOutlet weak var input3: UIButton!
    @IBOutlet weak var input4: UIButton!
    @IBOutlet weak var input5: UIButton!
    @IBOutlet weak var input6: UIButton!
    @IBOutlet weak var scoreCounter: UILabel!
    
    func generateSentences() {
        sentences.append([["What", "A", "Wonderful", "Morning", "Hello", "George"], ["What A Wonderful Morning"]])
        sentences.append([["Excellent", "Chocolate", "Chip", "Cookies", "Look", "Boots"], ["Excellent Chocolate Chip Cookies"]])
        sentences.append([["Confident", "Claire", "Sings", "Songs", "Tea", "ToHellWithGeorgia"], ["Confident Claire Sings Songs"]])
        sentences.append([["Brave", "Horses", "Run", "Quickly", "Oil", "Pride"], ["Brave Horses Run Quickly"]])
        sentences.append([["Intelligent", "Robots", "Play", "Soccer", "Chocolate", "Mud"], ["Intelligent Robots Play Soccer"]])
        sentences.append([["Fast", "Runners", "Are", "Victorious", "Above", "Eyebrows"], ["Fast Runners Are Victorious"]])
        sentences.append([["Courageous", "Firefighters", "Save", "People", "Below", "Banana"], ["Courageous Firefighters Save People"]])
    }
    
    func shuffleSentences() {
        sentences.shuffleInPlace()
    }
    
    //Set up view
    func setup() {
        sentences[sentenceCounter][0].shuffleInPlace()
        input1.setTitle(sentences[sentenceCounter][0][0], forState: UIControlState.Normal)
        input2.setTitle(sentences[sentenceCounter][0][1], forState: UIControlState.Normal)
        input3.setTitle(sentences[sentenceCounter][0][2], forState: UIControlState.Normal)
        input4.setTitle(sentences[sentenceCounter][0][3], forState: UIControlState.Normal)
        input5.setTitle(sentences[sentenceCounter][0][4], forState: UIControlState.Normal)
        input6.setTitle(sentences[sentenceCounter][0][5], forState: UIControlState.Normal)
    }
    
    //Reset view
    func reset() {
        clearDisplay(display1)
        clearDisplay(display2)
        clearDisplay(display3)
        clearDisplay(display4)
    }
    
    //New sentence builder
    func newScramble() {
        
    }
 
    //Update display upon pressing button. Check result once 4 fields are filled
    var hiddenButtons = Array<UIButton>()
    @IBAction func addWord(sender: UIButton) {
        if (display1.currentTitle! == " ") {
            display1.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display2.currentTitle! == " " {
            display2.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display3.currentTitle! == " " {
            display3.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
        } else if display4.currentTitle! == " " {
            display4.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            hiddenButtons.append(sender)
            sender.hidden = true
            evaluateResult()
        }
    }

    //Clear display when display is touched
    @IBAction func clearDisplay(sender: UIButton) {
        for button in hiddenButtons {
            if (button.currentTitle! == sender.currentTitle!) {
                button.hidden = false
            }
        }
        sender.setTitle(" ", forState: UIControlState.Normal)
    }

    //Check if user input is the same as correct string
    func evaluateResult() {
        let userAnswer = display1.currentTitle! + " " + display2.currentTitle! + " "
            + display3.currentTitle! + " " + display4.currentTitle!
        if userAnswer == sentences[sentenceCounter][1][0] {
            score += 1
            scoreCounter.text = "Score: \(score)"
            sentenceCounter += 1
            if sentenceCounter != sentences.count {
                reset()
                setup()
            }
        } else {
            reset()
        }
    }
}