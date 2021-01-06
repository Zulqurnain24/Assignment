//
//  Endpoint.swift
//  SwensonAssignment
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import Foundation

/* Endpoint
 This class houses all endpoint logic
 */

enum Endpoint: String {
    typealias RawValue = String
    
    //authentication
    case getRates = "latest?access_key=be45c67d065db6e1a46aa744fd154579&format=1"
    
    //items
    case getConversion = "convert?access_key=API_KEY&from=GBP&to=JPY&amount=25"
}
