//
//  ReferenceiOSSteps.swift
//  ReferenceiOSUITests
//
//  Created by Hagar Elshafei on 22/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

//I used Swift Extension to implement the steps. Extensions are powerful because the steps implemented using Swift Extension can be reused anywhere across the UI test target.
//I also used XCT activities to make the Xcode report much more readable.
extension ReferenceiOSTestBase {
    func givenAppIsReady(){
        XCTContext.runActivity(named: "Given app is ready"){ _ in
            XCTAssertTrue(ReferenceScreen.LabelField.element.label.contains("Hello"))
        }
    }
    
    func whenIClickOnButton(){
        XCTContext.runActivity(named: "When I click on button"){ _ in
            ReferenceScreen.Button.element.tap()
        }
    }
    
    func thenIShouldSeeGeneratedAmount(){
        XCTContext.runActivity(named: "Then I should see the generated amount"){ _ in
        XCTAssertTrue(ReferenceScreen.LabelField.element.label.contains("€ "))
        }
    }
}
