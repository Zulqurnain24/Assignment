//
//  CommonFunctionality.swift
//  SwensonAssignment
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit

protocol CommonFunctionalityProtocol: class {
    static func removeTopMostView()
    static func setShadow(_ view: UIView, intensity: Float)
    static func getTopMostView() -> UIViewController
    static func displayErrorAlert()
    static func addActivityIndicator(_ title: String, _ viewController: UIViewController)
    static func removeActivityIndicator(_ viewController: UIViewController)
    static func showGeneralAlert(viewController: UIViewController, title: String, message: String, okCallback: (()->Void)?, cancelCallback: (()->Void)?)
}

/* CommonFunctionality
 This contains the miscellaneous functionalities like presenting Alert and resizing the image
 */
final class CommonFunctionality: CommonFunctionalityProtocol {

    static func removeTopMostView() {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if let topController = keyWindow?.rootViewController {
            topController.view.subviews.filter({$0.tag == 111}).forEach({ view in
                view.removeFromSuperview()
            })
        }
    }
  
   static func setShadow(_ view: UIView, intensity: Float) {
         view.layer.shadowOffset  = CGSize(width: 0.0, height: 0.5)
         view.layer.shadowRadius  = 5.0
         view.layer.shadowOpacity = intensity
         view.clipsToBounds       = true
         view.layer.masksToBounds = false
   }
   
    static func getTopMostView() -> UIViewController {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if let topController = keyWindow?.rootViewController {
            return topController
        } else {
            return keyWindow!.rootViewController!
        }
    }

    static func displayErrorAlert() {
        
        let callback = { viewController in
            CommonFunctionality.showGeneralAlert(viewController: viewController, title: "Error", message: StringConstants.internetErrorMessageText, okCallback: {
            }, cancelCallback: {
                
            })
        }
        
        if #available(iOS 13, *) {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if var topController = keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                callback(topController)
            }
        } else {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                callback(topController)
            }
        }
        
    }
    
    static func addActivityIndicator(_ title: String, _ viewController: UIViewController) {
        
        DispatchQueue.main.async {
            let fancyLoaderFrame = CGRect(origin: viewController.view.frame.origin, size: CGSize(width: 0.35 * viewController.view.frame.size.width, height: 0.26 * viewController.view.frame.size.height))
            
            let fancyLoaderView:FancyLoaderView = FancyLoaderView(frame: fancyLoaderFrame)
            fancyLoaderView.center = viewController.view.center
            fancyLoaderView.tag = 222
            //populate values
            fancyLoaderView.titleLabelText = title
            
            fancyLoaderView.startAnimating()
            
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if let topController = keyWindow?.rootViewController {
                topController.view.bringSubviewToFront(fancyLoaderView)
                topController.view.addSubview(fancyLoaderView)
            }
        }
    }

    static func removeActivityIndicator(_ viewController: UIViewController) {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if let topController = keyWindow?.rootViewController {
                topController.view.subviews.filter({$0.tag == 222}).forEach({ view in
                    view.removeFromSuperview()
                })
            }
        }
    }
   
    static func showGeneralAlert(viewController: UIViewController, title: String, message: String, okCallback: (()->Void)?, cancelCallback: (()->Void)?)
    {
        DispatchQueue.main.async {
            let generalAlertViewFrame = CGRect(origin: viewController.view.frame.origin, size: CGSize(width: 0.95 * viewController.view.frame.size.width, height: 0.25 * viewController.view.frame.size.height))
            
            let generalAlertViewView:GeneralAlertView =  GeneralAlertView(frame: generalAlertViewFrame)
            generalAlertViewView.promptTitleLabel.text = title
            generalAlertViewView.promptDescriptionLabel.text = message
            generalAlertViewView.submitButtonCallback = okCallback
            generalAlertViewView.center = CGPoint(x: viewController.view.center.x, y: viewController.view.center.y - generalAlertViewView.frame.height)
            
            generalAlertViewView.tag = 111
            
           viewController.view.addSubview(generalAlertViewView)
        }
    }
}



