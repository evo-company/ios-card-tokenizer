//
//  CardExpirationDateTest.swift
//  TranzzoTokenizerTests
//
//  Created by user on 15.01.2020.
//  Copyright © 2020 Tranzzo. All rights reserved.
//

import XCTest
@testable import TranzzoTokenizer

class CardExpirationDateTest: XCTestCase {
    func testInitFromRawDateString() {
        let rawDateString = "04/24"
        var date = try? CardExpirationDate(rawDateString: rawDateString)
        XCTAssertEqual(date?.month, 4)
        XCTAssertEqual(date?.year, 24)
        let rawDateString2 = "1821"
        date = try? CardExpirationDate(rawDateString: rawDateString2)
        XCTAssertEqual(date?.month, 18)
        XCTAssertEqual(date?.year, 21)
        let rawDateStringLong = "04/2024"
        date = try? CardExpirationDate(rawDateString: rawDateStringLong)
        XCTAssertEqual(date?.month, 4)
        XCTAssertEqual(date?.year, 24)
        let rawDateStringTooLong = "4/202424"
        date = try? CardExpirationDate(rawDateString: rawDateStringTooLong)
        XCTAssertNil(date)
        let rawDateStringInvalid = "04"
        date = try? CardExpirationDate(rawDateString: rawDateStringInvalid)
        XCTAssertNil(date)
    }
}
