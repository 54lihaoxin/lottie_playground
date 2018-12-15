//
//  StringTests.swift
//  LottiePlaygroundTests
//
//  Created by Haoxin Li on 12/14/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import XCTest
@testable import LottiePlayground

class StringTests: XCTestCase {
    
    func testExample() {
        let cases = [["/root/Documents/", "/Inbox"],
                     ["/root/Documents/", "Inbox"],
                     ["/root/Documents", "/Inbox"],
                     ["/root/Documents", "Inbox"]]
        let expectedPath = "/root/Documents/Inbox"
        cases.forEach {
            let path = $0[0].appendingPathComponent($0[1])
            XCTAssertEqual(path, expectedPath)
        }
    }
}
