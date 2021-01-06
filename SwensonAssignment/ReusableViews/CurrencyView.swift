//
//  CurrencyView.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 05/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//


import UIKit

class CurrencyView: UIView {
    let kCONTENT_XIB_NAME = "CurrencyView"
    var view: UIView!
    @IBOutlet weak var currencyImageView: UIImageView!
       
    @IBOutlet weak var currencyLabel: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)

        xibSetup()
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
    
}
