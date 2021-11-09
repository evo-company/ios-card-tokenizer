/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

/// Defines the rules for various card providers.
public enum CardProvider: String, CaseIterable {
    case mastercard
    case visa
    case prostir
    case maestro
    case amex
    case mir
    case unionpay
    
    /// Name of a card provider
    public var name: String {
        switch self {
        case .visa:
            return "Visa"
        case .mastercard:
            return "Mastercard"
        case .maestro:
            return "Maestro"
        case .amex:
            return "American Express"
        case .prostir:
            return "Простір"
        case .unionpay:
            return "UnionPay"
        case .mir:
            return "Мир"
        }
    }
    
    /// Regex pattern for card number to satisfy for the provider
    var pattern: String {
        switch self {
        case .visa:
            return "^4[0-9]{12}(?:[0-9]{3})?$"
        case .mastercard:
            return "^(5[1-5]|222[1-9]|22[3-9]|2[3-6]|27[0-1]|2720)\\d*$"
        case .maestro:
            return "^(?:5[06789]\\d\\d|(?!6011[0234])(?!60117[4789])(?!60118[6789])(?!60119)(?!64[456789])(?!65)6\\d{3})\\d{8,15}$"
        case .amex:
            return "^3[47][0-9]{13}$"
        case .unionpay:
            return "^(62[0-9]{14,17})$"
        case .mir:
            return "^2"
        case .prostir:
            return "^9"
        }
    }
    
    private var prefixes: [PrefixContainable] {
        switch self {
        case .visa:
            return [4]
        case .mastercard:
            return [51...55, 2221...2720]
        case .maestro:
            return [5018, 5020, 5038, 5893, 6304, 6759, 6761, 6762, 6763]
        case .amex:
            return [34, 37]
        case .mir:
            return [2]
        case .prostir:
            return [9]
        case .unionpay:
            return [] // was unable to research it's prefixes
        }
    }
    
    /// Indeces of gaps expected in a card number for the provider
    var gaps: [Int] {
        switch self {
        case .visa, .maestro, .mastercard, .prostir, .mir:
                return [4, 8, 12]
        case .amex:
            return [4, 10]
        case .unionpay:
            return [4, 8, 12, 16]
        }
    }
    
    /// Valid length of a valid card number for the provider
    public var validLength: [Int] {
        switch self {
        case .visa, .mastercard, .prostir, .mir:
            return [16]
        case .maestro:
            return [12, 13, 14, 15, 16, 17, 18, 19]
        case .amex:
            return [15]
        case .unionpay:
            return [16, 20]
        }
    }
    
    /// Valid length of a valid card cvv for the provider
    public var validCVVLength: Int {
        switch self {
        case .visa, .mastercard, .prostir, .maestro, .mir, .unionpay:
            return 3
        case .amex:
            return 4
        }
    }
    
    func hasCommonPrefix(with string: String) -> Bool {
        return self.prefixes.first {
            $0.hasEqualPrefix(with: string)
        } != nil
    }
}

// Inspired by https://github.com/Rightpoint/CardParser/blob/master/CardParser.swift

private protocol PrefixContainable {
    func hasEqualPrefix(with string: String) -> Bool
}

extension String: PrefixContainable {
    func hasEqualPrefix(with string: String) -> Bool {
        return string.hasPrefix(self)
    }
}

extension ClosedRange: PrefixContainable where Bound == Int {
    func hasEqualPrefix(with string: String) -> Bool {
        for value in self {
            if value.hasEqualPrefix(with: string) {
                return true
            }
        }
        return false
    }
}

extension Int: PrefixContainable {
    func hasEqualPrefix(with string: String) -> Bool {
        return string.hasPrefix(String(describing: self))
    }
}
