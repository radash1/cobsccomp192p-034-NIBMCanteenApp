//
//  CanteenNIBMUITests.swift
//  CanteenNIBMUITests
//
//  Created by Ravindu Liyanage on 4/30/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import XCTest

class CanteenNIBMUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testSignupValidCredentials(){
        
        let app = XCUIApplication()
                 app.launch()
                app.buttons["Button"].tap()
               
                        
                        let vaildemail = "mnooo@gmail.com"
                        let validpass = "12345@aBc"
                        let vaildmobno = "0897654329"
                        
                        let emailTextField = app.textFields["Email Address"]
                        XCTAssertTrue(emailTextField.exists)
                        emailTextField.tap()
                        emailTextField.typeText(vaildemail)
                        
                        let passwordTextField = app.textFields["Password"]
                        XCTAssertTrue(passwordTextField.exists)
                        passwordTextField.tap()
                        passwordTextField.typeText(validpass)
                        
                        let mobileNumberTextField = app.textFields["Mobile Number"]
                        XCTAssertTrue(mobileNumberTextField.exists)
                        mobileNumberTextField.tap()
                        mobileNumberTextField.typeText(vaildmobno)
                app.buttons["Register"].tap()
            
        let emailTextField2 = app.textFields["Email Address"]
        XCTAssertTrue(emailTextField2.exists)
        emailTextField.tap()
            
        
    }
    
    func testSignupwrongCredentials_password(){
        
        let app = XCUIApplication()
          app.launch()
         app.buttons["Button"].tap()
        
                 
                 let vaildemail = "mno@gmail.com"
                 let validpass = "1234512bbc"
                 let vaildmobno = "0897654329"
                 
                 let emailTextField = app.textFields["Email Address"]
                 XCTAssertTrue(emailTextField.exists)
                 emailTextField.tap()
                 emailTextField.typeText(vaildemail)
                 
                 let passwordTextField = app.textFields["Password"]
                 XCTAssertTrue(passwordTextField.exists)
                 passwordTextField.tap()
                 passwordTextField.typeText(validpass)
                 
                 let mobileNumberTextField = app.textFields["Mobile Number"]
                 XCTAssertTrue(mobileNumberTextField.exists)
                 mobileNumberTextField.tap()
                 mobileNumberTextField.typeText(vaildmobno)
         app.buttons["Register"].tap()
    }
    
    func testSignupwrongCredentials_email()
    {
        
        let app = XCUIApplication()
         app.launch()
        app.buttons["Button"].tap()
       
                
                let vaildemail = "mnogmailcom"
                let validpass = "12345@aBc"
                let vaildmobno = "0897654329"
                
                let emailTextField = app.textFields["Email Address"]
                XCTAssertTrue(emailTextField.exists)
                emailTextField.tap()
                emailTextField.typeText(vaildemail)
                
                let passwordTextField = app.textFields["Password"]
                XCTAssertTrue(passwordTextField.exists)
                passwordTextField.tap()
                passwordTextField.typeText(validpass)
                
                let mobileNumberTextField = app.textFields["Mobile Number"]
                XCTAssertTrue(mobileNumberTextField.exists)
                mobileNumberTextField.tap()
                mobileNumberTextField.typeText(vaildmobno)
        app.buttons["Register"].tap()
        
   
    }
    func testSignup_emptyField()
    {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Button"].tap()
        app.buttons["Register"].tap()
        
    }
    
    
    func testInvalidLogin_wrongemailType(){
        
        let app = XCUIApplication()
         app.launch()
         
         let vaildemail = "mnogmailcom"
         let validpass = "12345@aBc"
         let vaildmobno = "08976543291"
         
         let emailTextField = app.textFields["Email Address"]
         XCTAssertTrue(emailTextField.exists)
         emailTextField.tap()
         emailTextField.typeText(vaildemail)
         
         let passwordTextField = app.secureTextFields["Password"]
         XCTAssertTrue(passwordTextField.exists)
         passwordTextField.tap()
         passwordTextField.typeText(validpass)
         
         let mobileNumberTextField = app.textFields["Mobile Number"]
         XCTAssertTrue(mobileNumberTextField.exists)
         mobileNumberTextField.tap()
         mobileNumberTextField.typeText(vaildmobno)
        
         app.buttons["Login"].tap()
    }
    
    func testForgetPassword_validemail()
    {
        
        let app = XCUIApplication()
        app.launch()
        let vaildemail = "zxc@gmail.com"
        
        app.buttons["Forget Passwowrd?"].tap()
        
        let emailTextField = app.textFields["Enter Email Address"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(vaildemail)
        
        app.buttons["Reset Password"].tap()
        
        let alertDialog = app.alerts["Success"]
        alertDialog.scrollViews.otherElements.buttons["OK"].tap()
        
        
       
        
        
    }
    func testForgetPassword_unvalidformat()
    {
            let app = XCUIApplication()
            app.launch()
           let vaildemail = "ahngmailcom"
            
        
            app.buttons["Forget Passwowrd?"].tap()
            
            
            let emailTextField = app.textFields["Enter Email Address"]
            XCTAssertTrue(emailTextField.exists)
            emailTextField.tap()
            emailTextField.typeText(vaildemail)
            
            app.buttons["Reset Password"].tap()

    }
    
    func testForgetPassword_unvalidemail()
    {
        
        let app = XCUIApplication()
        app.launch()
       let vaildemail = "ahn@gmail.com"
        
    
        app.buttons["Forget Passwowrd?"].tap()
        
        
        let emailTextField = app.textFields["Enter Email Address"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(vaildemail)
        
        app.buttons["Reset Password"].tap()
       
        
    }
    func testForgetPassword_emptyField()
    {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Forget Passwowrd?"].tap()
        app.buttons["Reset Password"].tap()
        app.navigationBars["CanteenNIBM.ForgetPassView"].buttons["Back"].tap()
        
    }
    
    func testInvalidLogin_wrongPasswordType(){
        
        let app = XCUIApplication()
         app.launch()
         
         let vaildemail = "mno@gmail.com"
         let validpass = "12345"
         let vaildmobno = "08976543291"
         
         let emailTextField = app.textFields["Email Address"]
         XCTAssertTrue(emailTextField.exists)
         emailTextField.tap()
         emailTextField.typeText(vaildemail)
         
         let passwordTextField = app.secureTextFields["Password"]
         XCTAssertTrue(passwordTextField.exists)
         passwordTextField.tap()
         passwordTextField.typeText(validpass)
         
         let mobileNumberTextField = app.textFields["Mobile Number"]
         XCTAssertTrue(mobileNumberTextField.exists)
         mobileNumberTextField.tap()
         mobileNumberTextField.typeText(vaildmobno)
        
         app.buttons["Login"].tap()
    }
    
    func testInvalidLogin_wrongCredentials(){
        
        let app = XCUIApplication()
         app.launch()
         
         let vaildemail = "mno@gmail.com"
         let validpass = "12345@aBc"
         let vaildmobno = "08976543291"
         
         let emailTextField = app.textFields["Email Address"]
         XCTAssertTrue(emailTextField.exists)
         emailTextField.tap()
         emailTextField.typeText(vaildemail)
         
         let passwordTextField = app.secureTextFields["Password"]
         XCTAssertTrue(passwordTextField.exists)
         passwordTextField.tap()
         passwordTextField.typeText(validpass)
         
         let mobileNumberTextField = app.textFields["Mobile Number"]
         XCTAssertTrue(mobileNumberTextField.exists)
         mobileNumberTextField.tap()
         mobileNumberTextField.typeText(vaildmobno)
        
         app.buttons["Login"].tap()
                
        
    }
    
    
    func testInvalidLogin_missingCredentiols()
    {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Login"].tap()
        let emailTextField = app.textFields["Email Address"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        
    }

    
    func testValidLoginSuccess() {
        let app = XCUIApplication()
        app.launch()
        
        let vaildemail = "zxc@gmail.com"
        let validpass = "Abc12345@"
        let vaildmobno = "0123456789"
        
        let emailTextField = app.textFields["Email Address"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(vaildemail)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validpass)
        
        let mobileNumberTextField = app.textFields["Mobile Number"]
        XCTAssertTrue(mobileNumberTextField.exists)
        mobileNumberTextField.tap()
        mobileNumberTextField.typeText(vaildmobno)
        
        app.buttons["Login"].tap()
        
        let TapBarFood = app.tabBars.buttons["FOOD"]
        TapBarFood.tap()

        
    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
