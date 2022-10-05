//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Beavean on 03.10.2022.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    func testInterfaceElements() throws {
        let app = XCUIApplication()
        let textToReverseTextField = app.textFields["Text to reverse"]
        let reverseButton = app.buttons["Reverse"]
        XCTAssertTrue(textToReverseTextField.exists)
        XCTAssertTrue(reverseButton.exists)
    }
    
    func testTextEntering() throws {
        let app = XCUIApplication()
        var textToReverseTextField = app.textFields["Text to reverse"]
        textToReverseTextField.tap()
        textToReverseTextField.typeText("test")
        textToReverseTextField = app.textFields["test"]
        XCTAssertTrue(textToReverseTextField.exists)
    }
    
    func testIfButtonIsDisabledUponLoad() throws {
        let app = XCUIApplication()
        let reverseButton = app.buttons["Reverse"]
        XCTAssertFalse(reverseButton.isEnabled)
    }
    
    func testResultLabelAppearance() throws {
        let app = XCUIApplication()
        let textToReverseTextField = app.textFields["Text to reverse"]
        let reverseButton = app.buttons["Reverse"]
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Test string")
        reverseButton.tap()
        let resultLabel = app.staticTexts["tseT gnirts"]
        XCTAssertTrue(resultLabel.exists)
    }
    
    func testButtonTapAndClear() throws {
        let app = XCUIApplication()
        var reverseButton = app.buttons["Reverse"]
        let textToReverseTextField = app.textFields["Text to reverse"]
        textToReverseTextField.tap()
        textToReverseTextField.typeText("test")
        reverseButton.tap()
        reverseButton = app.buttons["Clear"]
        let resultLabel = app.staticTexts["tset"]
        reverseButton.tap()
        reverseButton = app.buttons["Reverse"]
        XCTAssertFalse(reverseButton.isEnabled)
        XCTAssertFalse(resultLabel.exists)
    }
    
    func testButtonSwitchToClearAndReverseTitle() throws {
        let app = XCUIApplication()
        var reverseButton = app.buttons["Reverse"]
        let textToReverseTextField = app.textFields["Text to reverse"]
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
