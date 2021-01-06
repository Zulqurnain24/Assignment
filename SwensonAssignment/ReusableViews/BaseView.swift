//
//  BaseView.swift
//  SwensonAssignment
//
//  Created by macbook on 29/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
         
        super.init(frame: frame)
         
        self.setupTouchResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTouchResponder() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
