//
//  URLRequestBuilderTest.swift
//  TranzzoTokenizerTests
//
//  Created by user on 13.02.2020.
//  Copyright © 2020 Tranzzo. All rights reserved.
//

import XCTest
@testable import TranzzoTokenizer

class URLRequestBuilderTest: XCTestCase {
  func testCreateURLRequest() {
    let data = TestHelpers.createRequestData()
    let request = URLRequestBuilder.createURLRequest(to: "test.com", requestData: data)
    XCTAssertEqual(request?.httpMethod, data.method.rawValue)
    XCTAssertNotNil(request?.allHTTPHeaderFields)
  }
}
