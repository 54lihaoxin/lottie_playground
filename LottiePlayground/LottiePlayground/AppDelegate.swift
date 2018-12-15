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
}
