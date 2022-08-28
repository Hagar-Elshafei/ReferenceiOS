//
//  BDDTests.swift
//  ReferenceiOSUITests
//
//  Created by Hagar Elshafei on 22/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//


//Here I wrote a new BDD style XCUI test with given/when/then steps.
import Foundation
import XCTest

class BDDTest: ReferenceiOSTestBase {
    
    func testGenerateInBDDStyle(){
        givenAppIsReady()
        whenIClickOnButton()
        thenIShouldSeeGeneratedAmount()
    }
}
