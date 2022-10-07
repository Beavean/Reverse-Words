//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Beavean on 03.10.2022.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private lazy var textToReverseTextField = app.textFields["reverseTextField"]
    private lazy var reverseButton = app.buttons["reverseButton"]
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testInterfaceElements() {
        XCTAssertTrue(textToReverseTextField.exists)
        XCTAssertTrue(reverseButton.exists)
    }
    
    func testIfButtonIsDisabledUponLoad() {
        XCTAssertFalse(reverseButton.isEnabled)
    }
    
    func testResultLabelAppearance() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Test string")
        reverseButton.tap()
        let resultLabel = app.staticTexts["tseT gnirts"]
        XCTAssertTrue(resultLabel.exists)
    }
    
    func testButtonTapAndClear() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("test")
        reverseButton.tap()
        reverseButton = app.buttons["Clear"]
        let resultLabel = app.otherElements["resultLabel"]
        reverseButton.tap()
        reverseButton = app.buttons["Reverse"]
        XCTAssertFalse(reverseButton.isEnabled)
        XCTAssertFalse(resultLabel.exists)
    }
    
    func testButtonSwitchToClearAndReverseTitle() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("test")
        reverseButton.tap()
        reverseButton = app.buttons["Clear"]
        XCTAssertTrue(reverseButton.exists)
        textToReverseTextField.typeText("test")
        reverseButton = app.buttons["Reverse"]
        XCTAssertTrue(reverseButton.exists)
    }
}
