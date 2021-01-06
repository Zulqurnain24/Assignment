//
//  CurrencyListViewController.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 05/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

protocol ConversionViewControllerProtocol {
    func populateValues()
    func setupTextField()
    func textFieldDidChange(_ textField: UITextField)
}

class ConversionViewController: BaseViewController, ConversionViewControllerProtocol {

    var viewModel = ConversionViewModel()
    @IBOutlet weak var baseCurrencyView: ConversionView!
    
    @IBOutlet weak var conversionCurrencyView: ConversionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupTextField()
        populateValues()
    }
    
    func populateValues() {
        baseCurrencyView.currencyNameLabel.text = viewModel.getConversion().baseCurrencyCode
        conversionCurrencyView.currencyNameLabel.text = viewModel.getConversion().conversionCurrencyCode
    }
    
    func setupTextField() {
        baseCurrencyView.amountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        let currency = String(baseCurrencyView.amountTextField.text ?? "0.0")
        let baseAmount = Int(currency) ?? 0
        baseCurrencyView.amountTextField.text = "\( baseAmount )"
        
        let amount = Double(textField.text ?? "0.0") ?? 0.0
        let convertedAmount = amount * ((viewModel.getConversion().rate) ?? 0.00)
        conversionCurrencyView.amountTextField.text = "\(convertedAmount)"
    }

}
