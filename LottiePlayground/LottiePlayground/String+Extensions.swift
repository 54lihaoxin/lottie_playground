//
//  String+Extensions.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/14/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

extension StringProtocol {
    
    func appendingPathComponent(_ pathComponent: String) -> String {
        if hasSuffix("/") {
            if pathComponent.hasPrefix("/") {
                return "\(self)\(pathComponent.dropFirst())"
            } else {
                return "\(self)\(pathComponent)"
            }
        } else {
            if pathComponent.hasPrefix("/") {
                return "\(self)\(pathComponent)"
            } else {
                return "\(self)/\(pathComponent)"
            }
        }
    }
}
