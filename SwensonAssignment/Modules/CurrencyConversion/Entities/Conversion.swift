//
//  Conversion.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

struct Conversion: Codable, Equatable {
    let rate: Double?
    let baseCurrencyCode: String?
    let conversionCurrencyCode: String?
    
    init( rate: Double?,
          baseCurrencyCode: String?,
          conversionCurrencyCode: String?){
        self.rate = rate
        self.baseCurrencyCode = baseCurrencyCode
        self.conversionCurrencyCode = conversionCurrencyCode
    }

    static func == (lhs: Conversion, rhs: Conversion) -> Bool {
        return lhs.rate == rhs.rate
               &&
               lhs.baseCurrencyCode == rhs.baseCurrencyCode
               &&
               lhs.conversionCurrencyCode == rhs.conversionCurrencyCode
    }
}
