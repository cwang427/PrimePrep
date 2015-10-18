//
//  ViewController.swift
//  PrimePrep
//
//  Created by Cassidy Wang on 10/17/15.
//  Copyright © 2015 Cassidy Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addWord(sender: UIButton) {
        if (display1.currentTitle! == " ") {
            display1.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            sender.hidden = true
        } else if display2.currentTitle! == " " {
            display2.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            sender.hidden = true
        } else if display3.currentTitle! == " " {
            display3.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            sender.hidden = true
        } else if display4.currentTitle! == " " {
            display4.setTitle(sender.currentTitle!, forState: UIControlState.Normal)
            sender.hidden = true
            evaluateResult()
        }
    }
    
    @IBOutlet weak var display1: UIButton!
    @IBOutlet weak var display2: UIButton!
    @IBOutlet weak var display3: UIButton!
    @IBOutlet weak var display4: UIButton!

    @IBAction func clearDisplay(sender: UIButton) {
        sender.setTitle(" ", forState: UIControlState.Normal)
    }
    
    func evaluateResult() {
        let holdingArray = [display1.currentTitle!, display2.currentTitle!,
            display3.currentTitle!, display4.currentTitle!]
        
    }
    
}

