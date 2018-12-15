//
//  CGPoint+Extensions.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/15/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func offsetting(by point: CGPoint) -> CGPoint {
        return CGPoint(x: x + point.x, y: y + point.y)
    }
}
