//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

//Here I added the Initial UI Tests using XCUITest, also added screenshots of the app before and after generating the Amount

import XCTest

class ReferenceiOSUITests: ReferenceiOSTestBase {

    func testPageElementsExist(){
        XCTAyncAssert(app.staticTexts["Hello"])
        XCTAyncAssert(app.buttons["Button"])
    }
    
    func testGenerateBtnIsClickable(){
        XCTAssertTrue(app.buttons["Button"].isEnabled)
        XCTAssertTrue(app.buttons["Button"].isHittable)
    }
    
    func testGenerate() {
        snapshot("01-HelloScreen")
        app.buttons["Button"].tap()
        snapshot("02-GeneratedAmountScreen")
        let predicate = NSPredicate(format: "label BEGINSWITH '€ '")
        let generatedAmount = app.staticTexts.element(matching: predicate)
        XCTAssert(generatedAmount.exists)
    }
    
    func testAmountIsInRange(){
        
        app.buttons["Button"].tap()
        let result = app.staticTexts["label"].label
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "nl_NL")
        let number = formatter.number(from: result)
        let decimalValue = number?.decimalValue
        
        XCTAssertTrue(decimalValue! > 100 , "Generated Amount is below the minimum.")
        XCTAssertTrue(decimalValue! < 99999999 , "Generated Amount is above the maximum.")
    }
 
    //Test Case to test the app behavior after quiting the app and re-opening it
    func testAppBehaviorAfterRestart() {
        app.buttons["Button"].tap()
        tearDown()
        setUp()
        XCTAssertTrue(app.staticTexts["Hello"].exists, "Hello Label is not exist")
    }
    
    /**Waits for the app to finish launching */
    //Not used currently but can be used if we have multiple elements to be loaded, and we can enhance it by adding other params if needed
    func waitForLaunchToFinish(application: XCUIApplication) {
      let helloLabelPredicate = NSPredicate { _, _ in
        application.staticTexts["label"].exists
      }

      let generateButtonPredicate = NSPredicate { _, _ in
        application.buttons["Button"].exists
      }

      let predicate = NSCompoundPredicate(
        orPredicateWithSubpredicates: [
          helloLabelPredicate,
          generateButtonPredicate
        ]
      )

      let finishedLaunchingExpectation = expectation(for: predicate, evaluatedWith: nil, handler: nil)
      wait(for: [finishedLaunchingExpectation], timeout: 30)
    }
}
