//
//  CardFormatterTest.swift
//  TranzzoTokenizerTests
//
//  Created by user on 15.01.2020.
//  Copyright © 2020 Tranzzo. All rights reserved.
//

import XCTest
@testable import TranzzoTokenizer

class CardFormatterTest: XCTestCase {
    var sut: TranzzoCardFormatter!
    
    override func setUp() {
        super.setUp()
        sut = TranzzoCardFormatter()
    }
    
    func testFormatCardNumberForCardType() {
        let number = "4111_1111_1111_1111"
        let formattedNumber = "4111 1111 1111 1111"
        let formattedAmex = "4111 111111 111111"
        XCTAssertEqual(sut.format(cardNumber: number, for: .visa), formattedNumber)
        XCTAssertEqual(sut.format(cardNumber: number, for: .mastercard), formattedNumber)
        XCTAssertEqual(sut.format(cardNumber: number, for: .amex), formattedAmex)
    }
}

