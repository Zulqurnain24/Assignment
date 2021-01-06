//
//  CurrencyListViewController.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 05/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit
import FlagKit
import DropDown

protocol CurrencyListViewControllerProtocol {
    func setupDropDown()
    func setBaseCurrency()
    func attachListenerToCurrencyView()
    func selectBaseCurrency()
    func setDefaultCurrency()
    func setTableView()
    func setViewModel()
    func populateData()
    func registerTableViewCells()
    func performSegueToConversionScreen()
}

class CurrencyListViewController: BaseViewController, CurrencyListViewControllerProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currencyView: CurrencyView!
    //View model object
    var viewModel: CurrencyListViewModel?
    var selectedIndex = 0
    let dropDown = DropDown()
    var selectedConversion = Conversion(rate: 0.0, baseCurrencyCode: "", conversionCurrencyCode: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        
        setTableView()
        
        setViewModel()
        
        populateData()
        
        setDefaultCurrency()
        
        attachListenerToCurrencyView()
        
        setupDropDown()
    }
    
    func setupDropDown() {
        
        dropDown.anchorView = currencyView
        
        dropDown.dataSource = viewModel?.getRates().compactMap({ rate in
            return rate.dict.keys.first
        }) ?? []
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            let currencyDictionary = self.viewModel?.getRatesDictionary()
            self.selectedConversion = Conversion(rate: currencyDictionary?[item], baseCurrencyCode: item, conversionCurrencyCode: "")
            self.setBaseCurrency()
            self.viewModel?.updateDictionary(self.viewModel?.getRates()[index] ?? Rate(dict: [:]))
        }
        
        dropDown.show()
    }
    
    func setBaseCurrency() {
        let baseCurrencyCode = String(selectedConversion.baseCurrencyCode ?? "")
        let currencyString = String(baseCurrencyCode.dropLast())
        let flag = Flag(countryCode: currencyString)
        currencyView.currencyImageView.image = flag?.originalImage
        currencyView.currencyLabel.text = currencyString
        
    }
    
    func attachListenerToCurrencyView() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(selectBaseCurrency))
        currencyView.isUserInteractionEnabled = true
        currencyView.addGestureRecognizer(singleTap)
    }
    
    @objc func selectBaseCurrency() {
        setupDropDown()
    }
    
    func setDefaultCurrency() {
        currencyView.currencyLabel.text = "EUR"
        currencyView.currencyImageView.image = Flag(countryCode: "EU")?.originalImage
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88
    }
    
    func setViewModel() {
        viewModel = CurrencyListViewModel()
        viewModel?.delegate = self
    }
    
    func populateData() {
        viewModel?.fetchCurrencyList()
    }
    
    func registerTableViewCells() {
        tableView.register(UINib(nibName: String(describing: CurrencyRateCell.self), bundle: nil), forCellReuseIdentifier: StringConstants.rateCell.rawValue)
    }
    
    func performSegueToConversionScreen() {
        self.performSegue(withIdentifier: StringConstants.segueToConversionScreen.rawValue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if (segue.identifier == StringConstants.segueToConversionScreen.rawValue) {
            
            if let target = segue.destination as? ConversionViewController,
                let rate = viewModel?.getRates()[selectedIndex] {
                target.viewModel.setConversionResponse(conversion: Conversion(rate: rate.dict.values.first, baseCurrencyCode: currencyView.currencyLabel.text, conversionCurrencyCode: rate.dict.keys.first))
            }
        }
    }
}

extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getRates().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.rateCell.rawValue, for: indexPath) as? CurrencyRateCell
            else { return UITableViewCell() }
        
        viewModel?.configure(row: row, cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegueToConversionScreen()
    }
    
}

extension CurrencyListViewController: CurrencyViewModelDelegate {
    func getRates(_ rates: [Rate]?, _ error: String?) {
        guard error == nil
            else {
                CommonFunctionality.showGeneralAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: error?.description ?? "Unable to connect to the server please come back after a while", okCallback: nil, cancelCallback: nil)
                return
        }
        
        tableView.reloadData()
    }
    
}
