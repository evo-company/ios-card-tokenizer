/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation
/// Type that provides various card  formatting methods
final public class TranzzoCardFormatter {
  
    public init() {}
  
    /// Formats the card number to follow the rules of a specified provider
    ///
    /// - parameter cardNumber:          Input card number to format.
    /// - parameter provider:          `CardProvider`, that provides formatting rules.
    /// - Returns: Card number, that follows formatting rules of a specified provider
    public func format(cardNumber: String, for cardType: CardProvider) -> String {
        var filteredNumber = cardNumber
        if filteredNumber.containsNonDigits {
            filteredNumber = filteredNumber.digitsOnly
        }
        var index = 0
        var numberOfGaps = 0
        return filteredNumber.reduce("") {
            defer { index += 1 }
            guard cardType.gaps.count > numberOfGaps else { return "\($0)\($1)" }
            if index == cardType.gaps[numberOfGaps] {
                numberOfGaps += 1
                return "\($0) \($1)"
            }
            return "\($0)\($1)"
        }
    }
}
