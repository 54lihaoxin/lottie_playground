//
//  Constant.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/14/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

// Frequently Asked Questions
struct FAQ {
    
    // File system related
    struct File {
        static var documentPath: String {
            return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        }
    }
}
