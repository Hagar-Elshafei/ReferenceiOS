//
//  ReferenceiOSElements.swift
//  ReferenceiOSUITests
//
//  Created by Hagar Elshafei on 22/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

//Here I wrote XCUIElements in the form of enum
//Swift enums, we can store the UI element locators with their raw values as accessibility identifiers, and then we can use that enum everywhere within the UI test target

enum ReferenceScreen: String {
    case LabelField = "label"
    case Button = "Button"
    
    var element: XCUIElement {
        switch self {
        case .LabelField:
            return XCUIApplication().staticTexts[self.rawValue]
        case .Button:
            return XCUIApplication().buttons[self.rawValue]
        }
    }
}
