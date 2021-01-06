//
//  ConversionResponse.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

struct ConversionResponse: Codable, Equatable {
    var conversion: Conversion?
    
    init( conversion: Conversion?){
        self.conversion = conversion
    }

    mutating func setConversion(conversion: Conversion?) {
        self.conversion = conversion
    }
    
    static func == (lhs: ConversionResponse, rhs: ConversionResponse) -> Bool {
        return lhs.conversion == rhs.conversion
    }
}
