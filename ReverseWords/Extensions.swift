//
//  Extensions.swift
//  ReverseWords
//
//  Created by Beavean on 24.10.2022.
//

import Foundation

extension CharacterSet {
    func createStringWithAllCharacters() -> String {
        var charactersArray: [String] = []
        for plane: UInt8 in 0...16 where self.hasMember(inPlane: plane) {
            for unicode in UInt32(plane) << 16 ..< UInt32(plane + 1) << 16 {
                if let uniChar = UnicodeScalar(unicode), self.contains(uniChar) {
                    charactersArray.append(String(uniChar))
                }
            }
        }
        return charactersArray.joined()
    }
}

