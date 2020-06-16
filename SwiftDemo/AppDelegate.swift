//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by mana on 2020/6/10.
//  Copyright © 2020 mana. All rights reserved.
//

import UIKit
//import MainViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.loadTabbar()
        return true
    }

    func loadTabbar() -> Void {
        self.window?.rootViewController = MainViewController()
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }



}

