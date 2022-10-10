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
    private lazy var defaultSegmentedControlButton = app.segmentedControls.buttons["Default"]
    private lazy var customSegmentedControlButton = app.segmentedControls.buttons["Custom"]
    private lazy var resultLabel = app.staticTexts["resultLabel"]
    private lazy var customFilterTextField = app.textFields["customFilterTextField"]
    private lazy var defaultInformationLabel = app.staticTexts["defaultInformationLabel"]
    
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
    
    func test_interfaceElements() {
        XCTAssertTrue(textToReverseTextField.exists)
        XCTAssertTrue(reverseButton.exists)
        XCTAssertTrue(defaultSegmentedControlButton.exists)
        XCTAssertTrue(customSegmentedControlButton.exists)
        XCTAssertTrue(defaultInformationLabel.exists)
    }
    
    func text_customFilterTextFieldAppearance () {
        customSegmentedControlButton.tap()
        XCTAssertTrue(customFilterTextField.exists)
        XCTAssertFalse(defaultInformationLabel.exists)
    }
    
    func test_ifButtonIsDisabledUponLoad() {
        XCTAssertFalse(reverseButton.isEnabled)
    }
    
    func test_resultLabelAppearance() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Test string")
        reverseButton.tap()
        let resultLabel = app.staticTexts["tseT gnirts"]
        XCTAssertTrue(resultLabel.exists)
    }
    
    func test_buttonTapAndClear() {
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
    
    func test_buttonSwitchToClearAndReverseTitle() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("test")
        reverseButton.tap()
        reverseButton = app.buttons["Clear"]
        XCTAssertTrue(reverseButton.exists)
        textToReverseTextField.typeText("test")
        reverseButton = app.buttons["Reverse"]
        XCTAssertTrue(reverseButton.exists)
    }
    
    func test_inputAndResultCheckForDefaultExclusionCharacterSet() {
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Foxminded cool 24/7")
        reverseButton.tap()
        let resultLabel = app.staticTexts["dednimxoF looc 24/7"]
        XCTAssertTrue(resultLabel.exists)
    }
    
    func test_inputAndResultCheckForUserDefinedExclusionCharacterSet() {
        customSegmentedControlButton.tap()
        textToReverseTextField.tap()
        textToReverseTextField.typeText("Foxminded cool 24/7")
        customFilterTextField.tap()
        customFilterTextField.typeText("xl")
        reverseButton.tap()
        let resultLabel = app.staticTexts["dexdnimoF oocl 7/42"]
        XCTAssertTrue(resultLabel.exists)
    }
}
