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
    
    func test_reverseMethod_reverseStringWithLetters() {
        XCTAssertEqual(sut.reversedString("Test string"), "tseT gnirts")
    }
    
    func test_reverseMethod_reverseStringWithNumbers() {
        XCTAssertEqual(sut.reversedString("12 34 56 78 90"), "21 43 65 87 09")
    }
    
    func test_reverseMethod_reverseStringWithSymbols() {
        XCTAssertEqual(sut.reversedString("@:?!() $#,./"), ")(!?:@ /.,#$")
    }
    
    func test_ReverseMethod_reverseStringWithEmojis() {
        XCTAssertEqual(sut.reversedString("😵‍💫🤪 💥💣 💀👻"), "🤪😵‍💫 💣💥 👻💀")
    }
}
