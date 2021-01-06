//
//  NetworkErrorAlertView.swift
//  SwensonAssignment
//
//  Created by Mohammad Zulqarnain on 03/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol GeneralAlertViewDelegate {
    
    func setUpView()
    
    func xibSetup()
    
    func loadViewFromNib() -> UIView

    func submitButtonPressed(_ sender: Any)
    
}

class GeneralAlertView: BaseView, GeneralAlertViewDelegate {
    let kCONTENT_XIB_NAME = "GeneralAlertView"
    
    var view: UIView!

    @IBOutlet weak var promptDescriptionLabel: UILabel!
    @IBOutlet weak var promptTitleLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!

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
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if let topController = keyWindow?.rootViewController {
            let blurEffect = UIBlurEffect(style: .regular)
            let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
            blurVisualEffectView.frame = topController.view.frame
            blurVisualEffectView.center = view.center
            blurVisualEffectView.tag = 111
            addSubview(blurVisualEffectView)
            addSubview(view)
        }
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
