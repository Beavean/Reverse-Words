//
//  ReverseWordsUnitTests.swift
//  ReverseWordsUnitTests
//
//  Created by Beavean on 03.10.2022.
//

import XCTest
@testable import ReverseWords

final class ReverseWordsUnitTests: XCTestCase {
    
    private var sut: ReverseWordsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ReverseWordsViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Default character exclusion
    
    func test_reverseMethod_defaultFilter_firstStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "Foxminded cool 24/7", defaultFilter: true), "dednimxoF looc 24/7")
    }
    
    func test_reverseMethod_defaultFilter_secondStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "abcd efgh", defaultFilter: true), "dcba hgfe")
    }
    
    func test_reverseMethod_defaultFilter_thirdStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "a1bcd efg!h", defaultFilter: true), "d1cba hgf!e")
    }
    
    //MARK: - Custom character exclusion
    
    func test_reverseMethod_customFilter_firstStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "Foxminded cool 24/7", defaultFilter: false, customFilter: "xl"), "dexdnimoF oocl 7/42")
    }
    
    func test_reverseMethod_customFilter_secondStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "abcd efgh", defaultFilter: false, customFilter: "xl"), "dcba hgfe")
    }
    
    func test_reverseMethod_customFilter_thirdStringFromTask() {
        XCTAssertEqual(sut.reverseInput(string: "a1bcd efglh", defaultFilter: false, customFilter: "xl"), "dcb1a hgfle")
    }
}
