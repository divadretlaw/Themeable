//
//  AppDelegate.swift
//  Themeable
//
//  Created by David Walter on 28.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import UIKit
import Themeable

extension ThemeColors {
    static let light = ThemeColors.from(bundle: "light")
    static let dark = ThemeColors.from(bundle: "dark")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Theme.shared.features.append(.eureka)
        Theme.shared.colors = .light
        Theme.shared.apply(force: true)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}
