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
    
    func test_defaultFilter_reverseLettersInMixedString() {
        XCTAssertEqual(sut.reverseInputUsingDefaultFilter(string: "Foxminded cool 24/7"), "dednimxoF looc 24/7")
    }
    
    func test_defaultFilter_reverseLettersInSimpleString() {
        XCTAssertEqual(sut.reverseInputUsingDefaultFilter(string: "abcd efgh"), "dcba hgfe")
    }
    
    func test_defaultFilter_reverseLettersInStringWithSymbols() {
        XCTAssertEqual(sut.reverseInputUsingDefaultFilter(string: "a1bcd efg!h"), "d1cba hgf!e")
    }
    
    //MARK: - Custom character exclusion
    
    func test_customFilter_reverseLettersInMixedString() {
        XCTAssertEqual(sut.reverseInputUsingCustomFilter(string: "Foxminded cool 24/7", filter: "xl"), "dexdnimoF oocl 7/42")
    }
    
    func test_customFilter_reverseLettersInSimpleString() {
        XCTAssertEqual(sut.reverseInputUsingCustomFilter(string: "abcd efgh", filter: "xl"), "dcba hgfe")
    }
    
    func test_customFilter_reverseLettersInStringWithSymbols() {
        XCTAssertEqual(sut.reverseInputUsingCustomFilter(string: "a1bcd efglh", filter: "xl"), "dcb1a hgfle")
    }
}
