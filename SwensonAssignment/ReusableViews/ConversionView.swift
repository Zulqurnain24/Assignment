//
//  ConversionCell.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 05/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class ConversionView: UIView {
    let kCONTENT_XIB_NAME = "ConversionView"
    
    var view: UIView!

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyNameLabel: UILabel!

    var submitButtonCallback: (()->Void)?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        xibSetup()
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        xibSetup()
        setUpView()
    }
    
    func setUpView() {
        CommonFunctionality.setShadow(view, intensity: 0.2)
    }

    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: kCONTENT_XIB_NAME, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        submitButtonCallback?()
        removeFromSuperview()
    }

}
