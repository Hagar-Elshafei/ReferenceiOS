//
//  ReferenceiOSTestBase.swift
//  ReferenceiOSUITests
//
//  Created by Hagar Elshafei on 22/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

//Here I added a base class, so that we can avoid the code duplication in all the tests that will be added later

import Foundation
import XCTest

class  ReferenceiOSTestBase: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
    func XCTAyncAssert(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout:10)
        if isElementExist {
            XCTAssertTrue(element.exists)
        }
    }
  
}
