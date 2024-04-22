//
//  Model.swift
//  Calculadora1
//
//  Created by Cristian David Laguna Aldana on 20/04/24.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType: Hashable {
    case sum
    case multiplication
    case division
    case subtraction
}

struct KeyboardButton: Hashable {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let type: ButtonType
}

