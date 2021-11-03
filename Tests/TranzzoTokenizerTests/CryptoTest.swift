/*
 * Copyright (c) TRANZZO LTD - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 */

import XCTest
@testable import TranzzoTokenizer

class CryptoTest: XCTestCase {
    func testHmacSign() {
        let mockData = TestHelpers.MockRequstData(b: "2", a: "1", c: "3")
        let string = DataEncoder().stringEncode(mockData) ?? ""
        let sign = string.hmac(key: "secret")
        XCTAssertEqual("77de38e4b50e618a0ebb95db61e2f42697391659d82c064a5f81b9f48d85ccd5", sign)
    }
}
