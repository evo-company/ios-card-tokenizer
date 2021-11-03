/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import XCTest
@testable import TranzzoTokenizer

class DataEncoderTest: XCTestCase {
    var sut: DataEncoder!
    
    override func setUp() {
        super.setUp()
        sut = DataEncoder()
    }
    
    func testStringEncode() {
        let card = TestHelpers.MockRequstData(b: "2", a: "1", c: "3")
        let string = sut.stringEncode(card)
        XCTAssertEqual("123", string)
    }

}
