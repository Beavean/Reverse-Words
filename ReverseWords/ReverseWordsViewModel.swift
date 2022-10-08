//
//  ReverseWordsViewModel.swift
//  ReverseWords
//
//  Created by Beavean on 07.10.2022.
//

import Foundation

struct ReverseWordsViewModel {
    
    func reversedString(_ string: String) -> String {
        let parts = string.components(separatedBy: " ")
        let reversed = parts.map { String($0.reversed()) }
        return reversed.joined(separator: " ")
    }
}
