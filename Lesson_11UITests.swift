//
//  Lesson_11UITests.swift
//  Lesson 11UITests
//
//  Created by Владимир Воробьев on 16.02.2022.
//

import XCTest

class Lesson_11UITests: XCTestCase {

    var app: XCUIApplication!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testbuttonTesting () {

        let textLog = app.descendants(matching: .textField).matching(identifier: "textLog").element
        XCTAssertTrue(textLog.exists)
        
        let textPass = app.descendants(matching: .textField).matching(identifier: "textPass").element
        XCTAssertTrue(textPass.exists)
        
        let button = app.buttons["ВВОД"]
        XCTAssertFalse(button.isEnabled)
        
        textLog.tap()
        textLog.typeText("lkkkjhi")
        
        textPass.tap()
        textPass.typeText("asdfuytre")
        XCTAssertTrue(button.isEnabled)

    }
    



    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
