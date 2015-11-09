//
//  ViewController2.swift
//  Careskin
//
//  Created by felixyu on 15/11/5.
//  Copyright © 2015年 Careskin. All rights reserved.
//

import UIKit

class ViewControllerOld: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleTypingNumber = false
    
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
        let operationTest = sender.currentTitle!
        if userIsInTheMiddleTypingNumber {
            enter()
        }
        switch operationTest {
            /////演变与精简过程1
            //        case "×": performOperation({(op1:Double, op2:Double) -> Double in
            //            return op1*op2
            //            })
            /////演变与精简过程2
            //        case "×": performOperation({(op1, op2) in return op1*op2})
            /////演变与精简过程3
            //            case "×": performOperation({(op1, op2) in op1*op2})
            /////演变与精简过程4
            //        case "×": performOperation({$0*$1})
            /////演变与精简过程5
            //            case "×": performOperation(){$0*$1}
            /////演变与精简过程6
        case "×" : performOperation {$0 * $1}
            
        case "÷" : performOperation {$1 / $0}
        case "+" : performOperation {$0 + $1}
        case "−" : performOperation {$1 - $0}
        case "√" : performOperation1 {sqrt($0)}
        default : break
        }
    }
    
    func performOperation(operationFunc: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operationFunc(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation1(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    //    func multipay(op1:Double, op2:Double) -> Double{
    //        return op1*op2
    //    }
    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsInTheMiddleTypingNumber = false
        operandStack.append(displayValue)
        print("\(operandStack)")
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
