//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

//Here I added the Initial UI Tests using XCUITest

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
        app.buttons["Button"].tap()
        let predicate = NSPredicate(format: "label BEGINSWITH '€ '")
        let generatedAmount = app.staticTexts.element(matching: predicate)
        XCTAssert(generatedAmount.exists)
    }
 
    /**Test Case to test the app behavior after quiting the app and re-opening it**/
    func testAppBehaviorAfterRestart() {
        app.buttons["Button"].tap()
        tearDown()
        setUp()
        XCTAssertTrue(app.staticTexts["Hello"].exists, "Hello Label is not exist")
    }
    
    /**Waiting for the app to finish launching, we can pass params or any conditions **/
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
