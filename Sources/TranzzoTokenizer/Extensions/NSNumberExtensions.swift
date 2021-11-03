/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

extension NSNumber {
    var isBool: Bool {
        return type(of: self) == type(of: NSNumber(booleanLiteral: true))
    }
}
