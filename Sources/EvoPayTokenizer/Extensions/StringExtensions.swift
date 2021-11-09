/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

public extension String {
    var digitsOnly: String {
        return filter { $0.isNumber }
    }
    
    var containsNonDigits: Bool {
        return !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
}
