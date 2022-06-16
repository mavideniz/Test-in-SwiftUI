//
//  UnitTestTutorialUITests.swift
//  UnitTestTutorialUITests
//
//  Created by Doğancan Mavideniz on 16.06.2022.
//

import XCTest

class UnitTestTutorialUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testWelcome() throws {
        let welcome = app.staticTexts.element

        XCTAssert(welcome.exists)
        XCTAssertEqual(welcome.label, "Welcome!")
    }

    func testLoginButton() throws {
        app.launch()
        let login = app.buttons["loginButton"]
        XCTAssertEqual(login.label, "Login")
    }
    
    func testLoginFormAppearance() throws {
        app.buttons["loginButton"].tap()
        let loginNavBarTitle = app.staticTexts["Login"]
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testLoginForm() throws {
        app.buttons["Login"].tap()
        
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)
        
        let username = app.textFields["Username"]
        XCTAssert(username.exists)
        
        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
        
        let login = app.buttons["loginNow"]
        XCTAssert(login.exists)
        XCTAssertEqual(login.label, "Login")
        
        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }
    
    func testLoginDismiss() throws {
        app.buttons["Login"].tap()
        let dismiss = app.buttons["Dismiss"]
        dismiss.tap()
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }
    
    func testUsername() throws {
        app.buttons["Login"].tap()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
        XCTAssertNotEqual(username.value as! String, "")
    }
    
    func testPassword() throws {
        app.buttons["Login"].tap()
     
        app.secureTextFields.element.tap()
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()
        app.keyboards.buttons["Return"].tap()
     
        XCTAssertNotEqual(app.secureTextFields.element.value as! String, "")
    }
    
    func testLogin() throws {
        app.buttons["Login"].tap()
     
        app.textFields.element.tap()
        app.textFields.element.typeText("test")
     
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("pass")
        app.keyboards.buttons["Return"].tap()
     
        let loginButton = app.buttons["loginNow"]
        loginButton.tap()
     
        XCTAssertFalse(loginButton.waitForExistence(timeout: 0.5))
    }
    
    func testFailedLoginAlert() throws {
        app.buttons["Login"].tap()
        app.buttons["loginNow"].tap()
     
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
     
        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testLoginLogoutLabel() throws {
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
     
        try login()
     
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
    }
    
    func testWelcomeAfterLogin() throws {
        XCTAssert(app.staticTexts["Welcome!"].exists)
     
        try login()
     
        XCTAssert(app.staticTexts["Welcome test!"].exists)
    }
    
    func login() throws {
        app.buttons["Login"].tap()
     
        app.textFields.element.tap()
        app.textFields.element.typeText("test")
     
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("pass")
        app.keyboards.buttons["Return"].tap()
     
        app.buttons["loginNow"].tap()
    }
    
    func testLogout() throws {
        try login()
     
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
     
        app.buttons["loginButton"].tap()
     
        XCTAssert(app.staticTexts["Welcome!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
