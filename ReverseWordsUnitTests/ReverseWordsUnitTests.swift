//
//  ReverseWordsUnitTests.swift
//  ReverseWordsUnitTests
//
//  Created by Beavean on 03.10.2022.
//

import XCTest
@testable import ReverseWords

final class ReverseWordsUnitTests: XCTestCase {
    
    private var sut: ReverseWordsViewController!
    
    override func setUp() {
        super.setUp()
        sut = ReverseWordsViewController()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_reverseMethod_reverseString() throws {
        XCTAssertEqual(sut.reversedString("Test string"), "tseT gnirts")
    }
    
    func test_reverseMethod_reverseStringWithNumbers() throws {
        XCTAssertEqual(sut.reversedString("12 34 56 78 90"), "21 43 65 87 09")
    }
    
    func test_reverseMethod_reverseStringWithSymbols() throws {
        XCTAssertEqual(sut.reversedString("@:?!() $#,./"), ")(!?:@ /.,#$")
    }
    
    func test_ReverseMethod_reverseStringWithEmojis() throws {
        XCTAssertEqual(sut.reversedString("😵‍💫🤪 💥💣 💀👻"), "🤪😵‍💫 💣💥 👻💀")
    }
}
