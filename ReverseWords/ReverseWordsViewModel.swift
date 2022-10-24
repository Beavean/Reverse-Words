//
//  ReverseWordsViewModel.swift
//  ReverseWords
//
//  Created by Beavean on 07.10.2022.
//

import Foundation

final class ReverseWordsViewModel {
    
    //MARK: - Properties
    
    private let defaultAllowedCharacters = ".*[^A-Za-z].*"
    
    //MARK: - ViewModel Handlers
    
    func reverseInputUsingDefaultFilter(string: String) -> String {
        var reversedWords = [String]()
        let words = string.components(separatedBy: " ")
        for word in words {
            let reversedArrayOfCharacters = reversedArrayOfCharactersUsingDefaultFilterFrom(from: word)
            let joinedWord = reversedArrayOfCharacters.map { String($0) }
            let newJoinedWord = joinedWord.joined()
            reversedWords.append(newJoinedWord)
        }
        return reversedWords.joined(separator: " ")
    }
    
    func reverseInputUsingCustomFilter(string: String, filter: String?) -> String {
        var reversedWords = [String]()
        let words = string.components(separatedBy: " ")
        for word in words {
            let reversedArrayOfCharacters = reversedArrayOfCharacters(from: word, filter: filter)
            let joinedWord = reversedArrayOfCharacters.map { String($0) }
            let newJoinedWord = joinedWord.joined()
            reversedWords.append(newJoinedWord)
        }
        return reversedWords.joined(separator: " ")
    }
    
    //MARK: - Helpers
    
    private func checkIfCharacterIsAllowedByDefault(_ character: Character) -> Bool {
        let characterAsString = "\(character)"
        return characterAsString.range(of: defaultAllowedCharacters, options: .regularExpression) != nil
    }
    
    private func reversedArrayOfCharacters(from word: String, filter: String?) -> [Character] {
        let characters = Array(word)
        var notInFilterCharacters = [Character]()
        var filteredCharacters = [Int: Character]()
        for (index, character) in characters.enumerated() {
            if Array(filter ?? "").contains(character) {
                filteredCharacters[index] = character
            } else {
                notInFilterCharacters.append(character)
            }
        }
        var reversedArrayOfCharacters = Array(notInFilterCharacters.reversed())
        for index in 0...word.count {
            if let filteredCharacter = filteredCharacters[index] {
                reversedArrayOfCharacters.insert(filteredCharacter, at: index)
            }
        }
        return reversedArrayOfCharacters
    }
    
    private func reversedArrayOfCharactersUsingDefaultFilterFrom(from word: String) -> [Character] {
        let characters = Array(word)
        var notInFilterCharacters = [Character]()
        var filteredCharacters = [Int: Character]()
        for (index, character) in characters.enumerated() {
            if checkIfCharacterIsAllowedByDefault(character) {
                filteredCharacters[index] = character
            } else {
                notInFilterCharacters.append(character)
            }
        }
        var reversedArrayOfCharacters = Array(notInFilterCharacters.reversed())
        for index in 0...word.count {
            if let filteredCharacter = filteredCharacters[index] {
                reversedArrayOfCharacters.insert(filteredCharacter, at: index)
            }
        }
        return reversedArrayOfCharacters
    }
}
