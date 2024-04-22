//
//  ViewModel.swift
//  Calculadora1
//
//  Created by Cristian David Laguna Aldana on 21/04/24.
//

import Foundation


final class ViewModel: ObservableObject {
    @Published var textFieldValue: String = "0"
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic(key: KeyboardButton) {
        switch key.type {
        case .number(let value) :
            tapNumber(value: value)
        case .reset:
            reset()
        case .result:
            result()
        case .operation(let type) :
           operation(type: type)
        }
    }
    
    func reset() {
        textFieldValue = "0"
        textFieldSavedValue = "0"
        currentOperationToExecute = nil
        shouldRunOperation = false
    }
    
    func tapNumber(value: Int) {
        if shouldRunOperation {
            textFieldValue = "0"
        }
        shouldRunOperation = false
        textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
        print(textFieldValue, "XD")
    }
    
    func result() {
        guard let operation = currentOperationToExecute else {
            return
        }
        
        switch operation {
        case .multiplication:
            textFieldValue = "\(Int(textFieldValue)! * Int(textFieldSavedValue)!)"
        case .sum:
            textFieldValue = "\(Int(textFieldValue)! + Int(textFieldSavedValue)!)"
        case .division:
            textFieldValue = "\(Int(textFieldValue)! / Int(textFieldSavedValue)!)"
        case .subtraction:
            textFieldValue = "\(Int(textFieldSavedValue)! - Int(textFieldValue)!)"
        }
        print(textFieldValue)
    }
    
    func operation(type: OperationType?) {
        textFieldSavedValue = textFieldValue
        currentOperationToExecute = type
        shouldRunOperation = true
    }
}
