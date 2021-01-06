//
//  AppDelegate.swift
//  SwensonAssignment
//
//  Created by macbook on 26/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 11.0, *) {
            let storyboard = UIStoryboard(name: StringConstants.main.rawValue, bundle: nil)
            let splashViewController = storyboard.instantiateViewController(withIdentifier: StringConstants.currencyListViewController.rawValue)
            let navigation = UINavigationController(rootViewController: splashViewController)
            
            let frame = UIScreen.main.bounds
            window = UIWindow(frame: frame)
            
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: StringConstants.defaultConfiguration.rawValue, sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

