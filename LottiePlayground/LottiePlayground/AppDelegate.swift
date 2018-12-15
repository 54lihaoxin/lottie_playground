//
//  AppDelegate.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/14/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("Document Path: %@", FAQ.File.documentPath)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("\(#function) \(url) \(options)")
        guard let rootViewController = window?.rootViewController else {
            assertionFailure("\(#function) `rootViewController` is nil")
            return false
        }
        
        return InboxFileHandler.handleInboxFileUrl(url, inRootViewController: rootViewController)
    }
}
