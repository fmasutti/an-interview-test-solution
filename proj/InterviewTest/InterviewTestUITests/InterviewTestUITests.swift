//
//  InterviewTestUITests.swift
//  InterviewTestUITests
//
//  Created by Frantiesco Masutti on 02/03/2021.
//

import XCTest

class InterviewTestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func sampleAppFlow() throws {
        
        let app = XCUIApplication()
        app.navigationBars["Produced Beers"].staticTexts["Produced Beers"].tap()
        
        let nameBuzzStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Name: Buzz"]/*[[".cells.staticTexts[\"Name: Buzz\"]",".staticTexts[\"Name: Buzz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nameBuzzStaticText.tap()
        app.navigationBars["Buzz"].buttons["Produced Beers"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.staticTexts["ABV: 4.5"].tap()
        elementsQuery.textViews.staticTexts["A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once."].tap()
        elementsQuery.staticTexts["Methods"].tap()
        elementsQuery.staticTexts["Duration:"].tap()
        
        let methodsElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Methods")
        methodsElementsQuery.children(matching: .other).element(boundBy: 3).staticTexts["Temperature:"].tap()
        
        let element = methodsElementsQuery.children(matching: .other).element(boundBy: 5)
        element.staticTexts["Temperature:"].tap()
        
        let idleStaticText = element/*@START_MENU_TOKEN@*/.staticTexts["IDLE"]/*[[".buttons[\"IDLE\"].staticTexts[\"IDLE\"]",".staticTexts[\"IDLE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        idleStaticText.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["DONE"]/*[[".buttons[\"DONE\"].staticTexts[\"DONE\"]",".staticTexts[\"DONE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        idleStaticText.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
