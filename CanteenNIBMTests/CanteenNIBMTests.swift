//
//  CanteenNIBMTests.swift
//  CanteenNIBMTests
//
//  Created by Ravindu Liyanage on 4/30/21.
//  Copyright © 2021 Ravindu Liyanage. All rights reserved.
//

import XCTest
@testable import CanteenNIBM


class CanteenNIBMTests: XCTestCase {

        
    var sut : LoginViewController!
    var sin : SignUpViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginVC")as? LoginViewController
         sin  = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")as? SignUpViewController
        sut.loadViewIfNeeded()
         sin.loadViewIfNeeded()
    }
   
    override func tearDown() {
        sut = nil
        sin = nil
        super.tearDown()
    }
    
    func  testLoginEmailTextField() throws {
        
        
        let emailfield = try XCTUnwrap(sut.Emailtxt,"email address UITextField is not connected")
        
         XCTAssertEqual(emailfield.textContentType, UITextContentType.emailAddress, "Email Address does not have Email Address content type on text field")
        
    }
        func  testLoginPassTextField() throws {
            
        let Passfield = try XCTUnwrap(sut.Pwdtxt,"Password UITextField is not connected")

        
        XCTAssertTrue(Passfield.isSecureTextEntry, "Password UIText Fields not a Secure Text Entry Field")
        
    }
    
    func  testmobnoTextField() throws {
               
           let mobno = try XCTUnwrap(sut.Mobnotxt,"mobile number UITextField is not connected")

           
         XCTAssertEqual(mobno.textContentType, UITextContentType.telephoneNumber, "Email Address does not have Email Address content type on text field")
           
       }
    
    func  testSignEmailTextField() throws {
        
        
        let emailfield = try XCTUnwrap(sin.emailtxt,"email address UITextField is not connected")
        
         XCTAssertEqual(emailfield.textContentType, UITextContentType.emailAddress, "Email Address does not have Email Address content type on text field")
        
    }
        func  testSignPassTextField() throws {
            
            let Passfield = try XCTUnwrap(sin.pwdtxt,"Password UITextField is not connected")

        
        XCTAssertTrue(Passfield.isSecureTextEntry, "Password UIText Fields not a Secure Text Entry Field")
        
    }
    func  testsignmobnoTextField() throws {
                 
             let mobno = try XCTUnwrap(sin.mobnotxt,"mobile number UITextField is not connected")

             
           XCTAssertEqual(mobno.textContentType, UITextContentType.telephoneNumber, "mobno does not have telephone number content type on text field")
             
         }
    
}
