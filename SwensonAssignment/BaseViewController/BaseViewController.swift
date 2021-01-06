//
//  BaseViewController.swift
//  SwensonAssignment
//
//  Created by Mohammad Zulqurnain 17/05/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

protocol BaseViewControllerDelegate {
    func setupTouchResponder()
    func dismissKeyboard()
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {

    override func loadView() {
        super.loadView()
        
        setupTouchResponder()
    }
   
    func setupTouchResponder() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

