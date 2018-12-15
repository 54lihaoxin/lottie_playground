//
//  InboxFileHandler.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/14/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation
import UIKit

/**
 Handle files copied from some other app to the "/Documents/Inbox" directory of this app.
 
 */
struct InboxFileHandler {
    
    static var inboxDirectory: String {
        return FAQ.File.documentPath.appending("")
    }
    
    /**
     Returns whether the provided `url` represents a URL of a file in the /Documents/Inbox directory.
     */
    static func handleInboxFileUrl(_ url: URL, inRootViewController rootViewController: UIViewController) -> Bool {
        #warning("TODO")
        return false
    }
}
