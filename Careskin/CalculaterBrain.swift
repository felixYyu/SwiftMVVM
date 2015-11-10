//
//  CalculaterBrain.swift
//  Careskin
//
//  Created by felixyu on 15/11/9.
//  Copyright © 2015年 Careskin. All rights reserved.
//

import Foundation

class CalculaterBrain {
    
    private enum Op : CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description : String {
            get {
                switch self {
                case .Operand(let operand) :
                    return "\(operand)"
                case .UnaryOperation(let symbole, _):
                    return symbole
                case .BinaryOperation(let symbole, _):
                    return symbole
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knowOps = [String:Op]()
    
    init() {
        func learnOp(op: Op){
            knowOps[op.description] = op
        }
        learnOp(Op.BinaryOperation("×", *))
        knowOps["÷"] = Op.BinaryOperation("÷") {$1 / $0}
        knowOps["+"] = Op.BinaryOperation("+", +)
        knowOps["−"] = Op.BinaryOperation("−"){$1 - $0}
        knowOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    typealias PropertyList = AnyObject
    
    var program: PropertyList {//guaranteed to be a propertyList
        get{
            return opStack.map{ $0.description }
        }
        set{
            if let opSymbols = newValue as? Array<String> {
                var newOpStack = [Op]()
                for opSymbol in opSymbols {
                    if let op = knowOps[opSymbol] {
                        newOpStack.append(op)
                    }else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue{
                        newOpStack.append(.Operand(operand))
                    }
                }
                opStack = newOpStack
            }
        }
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps:[Op]){
        
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand) :
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation) :
                let operationEvaluate = evaluate(remainingOps)
                if let operand = operationEvaluate.result {
                    return (operation(operand), operationEvaluate.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluate = evaluate(remainingOps)
                if let operand1 = op1Evaluate.result {
                    let op2Evaluate = evaluate(op1Evaluate.remainingOps)
                    if let operand2 = op2Evaluate.result{
                        return (operation(operand1, operand2), op2Evaluate.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand : Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol : String) -> Double? {
        if let operation = knowOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
    
}
