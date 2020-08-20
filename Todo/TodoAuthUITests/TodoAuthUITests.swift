//
//  TodoAuthUITests.swift
//  TodoAuthUITests
//
//  Created by chen.sinyu on 2020/08/20.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import XCTest

class TodoAuthUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginFailed() {
        let app = XCUIApplication()
        let loginButton = app.buttons["loginButton"]
        let mailTextField = app.textFields["mailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        
        mailTextField.tap()
        mailTextField.typeText("test234@example.com")
        passwordTextField.tap()
        passwordTextField.typeText("test123")
        loginButton.tap()
        XCTAssertEqual(app.alerts.element.label, "メッセージ")
        XCTAssert(app.alerts.element.staticTexts["登録失敗しました"].exists)
        
    }
    
    
    func testLoginSuccess() {
        let app = XCUIApplication()
        let loginButton = app.buttons["loginButton"]
        let mailTextField = app.textFields["mailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        
        mailTextField.tap()
        mailTextField.typeText("test123@example.com")
        passwordTextField.tap()
        passwordTextField.typeText("test123")
        loginButton.tap()
        
    }
}
