//
//  TodoAuthUITests.swift
//  TodoAuthUITests
//
//  Created by chen.sinyu on 2020/08/20.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import XCTest

class TodoAuthUITests: XCTestCase {
     let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginFailed() {
    
        let mailTextField = app.textFields["mailTextField"]
        mailTextField.tap()
        mailTextField.typeText("test234@example.com")
        
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("test123")
        
       
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        XCTAssertEqual(app.alerts.element.label, "メッセージ")
        XCTAssert(app.alerts.element.staticTexts["登録失敗しました"].exists)
        
    }
    
    
    func testLoginSuccess() {
        
        let mailTextField = app.textFields["mailTextField"]
        mailTextField.tap()
        mailTextField.typeText("test123@example.com")
        
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("test123")
        
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        
    }
}
