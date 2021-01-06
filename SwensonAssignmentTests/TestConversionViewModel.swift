//
//  TestConversionViewModel.swift
//  SwensonAssignmentTests
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import XCTest
@testable import SwensonAssignment

class TestConversionViewModel: XCTestCase {
    
    var sut: ConversionViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ConversionViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewModel() {
        let conversion =  Conversion( rate: 1.230065,
            baseCurrencyCode: "USD",
            conversionCurrencyCode: "PKR")
        sut.setConversionResponse(conversion: conversion)
        
        XCTAssertEqual(sut.getConversion(), conversion)
    }
}
