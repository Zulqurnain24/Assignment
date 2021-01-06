//
//  Enums.swift
//  SwensonAssignment
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import Foundation

// swift result type
enum RequestType: String, Codable {
    typealias RawValue = String
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

// swift result type
enum ResultType<T> {
    case Success(T)
    case Failure(e: Error)
}

// Error for unknown case
enum JSONDecodingError: Error, LocalizedError {
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("Unknown Error occured", comment: "")
        }
    }
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    case currencyListViewController = "currencyListViewController"
    case segueToConversionScreen = "segueToConversionScreen"
    case main = "Main"
    case loading = "Loading"
    case rateCell = "rateCell"
    case defaultConfiguration = "Default Configuration"
    case noConnection = "No Connection"
    case internetErrorTitleText = "Error"
    case internetErrorMessageText = "Please make sure you are connected to internet. Close the app and open again after restoring internet"
}

