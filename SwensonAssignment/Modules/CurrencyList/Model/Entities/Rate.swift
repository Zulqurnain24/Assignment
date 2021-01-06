//
//  Item.swift
//  SwensonAssignment
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

struct Rate: Codable, Equatable {

    let dict: [String : Double]
    
    private enum UserKeys: String, CodingKey {
        case dict
    }
    
    init(dict: [String : Double]){
        self.dict = dict
    }

    static func == (lhs: Rate, rhs: Rate) -> Bool {
        return lhs.dict == rhs.dict
    }
}
