/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation
@testable import TranzzoTokenizer

final class TestHelpers {
    struct MockRequstData: Encodable {
        let b: String
        let a: String
        let c: String
    }
    
    static func createValidCardRequestData() -> CardRequestData {
        return CardRequestData(cardNumber: "4242424242424242", expirationDate: CardExpirationDate(month: 11, year: 22), cardCvv: "123")
    }
    
    static func createInvalidCardRequestData() -> CardRequestData {
        CardRequestData(cardNumber: "4242424242424241", expirationDate: CardExpirationDate(month: 22, year: 22), cardCvv: "123")
    }
  
  static func createRequestData() -> RequestData {
    return .tokenize(card: createValidCardRequestData())
  }
}
