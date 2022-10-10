//
//  ReverseWordsViewModel.swift
//  ReverseWords
//
//  Created by Beavean on 07.10.2022.
//

import Foundation

struct ReverseWordsViewModel {
    
    private let defaultAllowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func reverseInput(string: String, defaultFilter: Bool, customFilter: String? = "") -> String {
        var resultWords = [String]()
        let words = string.components(separatedBy: " ")
        for word in words {
            let filterElements = defaultFilter ? Array(defaultAllowedCharacters) : Array(customFilter ?? "")
            let characters = Array(word)
            var enumeratedAndFilteredCharacters = [Character]()
            var filteredCharacters = [Int: Character]()
            for (index, character) in characters.enumerated() {
                if defaultFilter ? !filterElements.contains(character) : filterElements.contains(character) {
                    filteredCharacters[index] = character
                } else {
                    enumeratedAndFilteredCharacters.append(character)
                }
            }
            var reversedArrayOfCharacters = Array(enumeratedAndFilteredCharacters.reversed())
            for index in 0...string.count {
                if let filteredCharacter = filteredCharacters[index] {
                    reversedArrayOfCharacters.insert(filteredCharacter, at: index)
                }
            }
            let joinedWord = reversedArrayOfCharacters.map{ String($0) }
            let newJoinedWord = joinedWord.joined()
            resultWords.append(newJoinedWord)
        }
        return resultWords.joined(separator: " ")
    }
}
