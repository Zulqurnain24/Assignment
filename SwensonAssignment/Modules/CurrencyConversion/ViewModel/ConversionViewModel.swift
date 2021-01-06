//
//  ConversionViewModel.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//


import UIKit

protocol ConversionViewModelProtocol {
    func setConversionResponse(conversion: Conversion?)
    func getConversion() -> Conversion
}

protocol ConversionViewModelDelegate: class {
    func getCurrencyList(_ currencyList: [Rate]?, _ error: String?)
}

class ConversionViewModel: ConversionViewModelProtocol {
    private var conversionResponse: ConversionResponse?
    weak var delegate: ConversionViewModelDelegate?

    func setConversionResponse(conversion: Conversion?) {
         conversionResponse = ConversionResponse(conversion: conversion)
    }
    
    func getConversion() -> Conversion {
        return conversionResponse?.conversion ?? Conversion(rate: 0.0, baseCurrencyCode: "", conversionCurrencyCode: "")
    }

}
