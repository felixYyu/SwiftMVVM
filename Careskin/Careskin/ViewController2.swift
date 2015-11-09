//
//  ViewController2.swift
//  Careskin
//
//  Created by felixyu on 15/11/5.
//  Copyright © 2015年 Careskin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleTypingNumber = false
    var brain = CalculaterBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleTypingNumber {
            display.text = display.text! + digit
            print("digit = \(digit)")
        }else{
            display.text = digit
            print(" init digit = \(digit)")
            userIsInTheMiddleTypingNumber = true
        }
        
    }
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleTypingNumber {
            enter()
        }
        if let operation = sender.currentTitle {
            displayValue = brain.performOperation(operation)!
        }else {
            displayValue = 0
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleTypingNumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue : Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
        }
    }
}
