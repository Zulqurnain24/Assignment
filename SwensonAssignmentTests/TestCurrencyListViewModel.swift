//
//  TestCurrencyListViewModel.swift
//  SwensonAssignmentTests
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import XCTest
@testable import SwensonAssignment

class TestCurrencyListViewModel: XCTestCase {
    
    var sut: CurrencyListViewModel!
    
    override func setUp() {
        super.setUp()
        sut = CurrencyListViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewModel() {
        sut.setRatesResponse(success: true, timestamp: 134234, base: "USD", date: "2021-01-05", rates: ["AED":4.517976,"USD":1.230065])
        let firstRate = Rate(dict: ["AED" : 4.517976])
        
        XCTAssertEqual(sut.getRates().first, firstRate)
    }
}
