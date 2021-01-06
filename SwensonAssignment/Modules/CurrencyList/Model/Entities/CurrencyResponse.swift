//
//  ItemsResponse.swift
//  SwensonAssignment
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

struct RateResponse: Codable, Equatable {
    let success: Bool?
    let timestamp: Int?
    let base: String?
    let date: String?
    var rates: Dictionary<String, Double>?
    
    init(success: Bool?,
         timestamp: Int?,
         base: String?,
         date: String?,
         rates: Dictionary<String, Double>?){
        self.success = success
        self.timestamp = timestamp
        self.base = base
        self.date = date
        self.rates = rates
    }

    mutating func setList(rates: Dictionary<String, Double>?) {
        self.rates = rates
    }
    
    static func == (lhs: RateResponse, rhs: RateResponse) -> Bool {
        return lhs.success == rhs.success
               &&
               lhs.timestamp == rhs.timestamp
               &&
               lhs.base == rhs.base
               &&
               lhs.date == rhs.date
               &&
               lhs.rates == rhs.rates
    }
}
