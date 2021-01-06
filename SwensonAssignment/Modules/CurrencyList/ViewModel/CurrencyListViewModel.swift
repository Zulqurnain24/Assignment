//
//  ItemsViewModel.swift
//  SwensonAssignment
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import FlagKit

protocol CurrencyListViewModelProtocol {
    func configure(row: Int, cell: CurrencyRateCell)
    func setRatesResponse(success: Bool?, timestamp: Int?, base: String?, date: String?, rates: Dictionary<String, Double>?)
    func updateDictionary(_ rate: Rate)
    func getRatesDictionary() -> [String : Double]
    func getRates() -> [Rate]
    func fetchCurrencyList()
}

protocol CurrencyViewModelDelegate: class {
    func getRates(_ rates: [Rate]?, _ error: String?)
}

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    private let webserviceManager = WebserviceManager()
    private var rateResponse: RateResponse?
    weak var delegate: CurrencyViewModelDelegate?

    func configure(row: Int, cell: CurrencyRateCell) {
        let rate = getRates()[row]
        let currencyName = rate.dict.keys.first
        let rateAmount = rate.dict.values.first
        cell.currencyView.currencyLabel.text = rate.dict.keys.first
        
        cell.currencyView.currencyImageView.image = Flag(countryCode: String(currencyName?.dropLast() ?? ""))?.originalImage
        cell.rateLabel.text = "\(rateAmount ?? 0.0)"
    }

    func setRatesResponse(success: Bool?, timestamp: Int?, base: String?, date: String?, rates: Dictionary<String, Double>?) {
        rateResponse = RateResponse(success: success, timestamp: timestamp, base: base, date: date, rates: rates)
    }
    
    func updateDictionary(_ rate: Rate) {
        guard let ratesDictionary = rateResponse?.rates else { return }
        for (key, value) in ratesDictionary {
            rateResponse?.rates?[key] = value/(rate.dict.values.first ?? 1)
        }
    }
    
    func getRatesDictionary() -> [String : Double] {
        
        return rateResponse?.rates ?? Dictionary<String, Double>()
    }
    
    func getRates() -> [Rate] {
        var arrayOfDictionaries = [Rate]()
        rateResponse?.rates?.forEach({ (k,v) in
            arrayOfDictionaries.append(Rate(dict: [k : v]))
        })
        
        return arrayOfDictionaries
    }
    
    func fetchCurrencyList() {
        webserviceManager.callCurrencyListService({ rateResponse in
            self.rateResponse = rateResponse
            self.delegate?.getRates(self.getRates(), nil)
        }, { error in
             self.delegate?.getRates(nil, error)
            CommonFunctionality.displayErrorAlert()
        })
    }

}
