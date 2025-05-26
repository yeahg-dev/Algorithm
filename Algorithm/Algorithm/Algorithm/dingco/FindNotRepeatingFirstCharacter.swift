//
//  FindNotRepeatingFirstCharacter.swift
//  Algorithm
//
//  Created by 문예지 on 5/26/25.
//

import Foundation

struct FindNotRepeatingFirstCharacter {
    
    static func findNotRepeatingFirstCharacter(_ string: String) -> Character {
        
        var occurenceArray = getAlphabeyOccurenceArray(string)
        
        var notRepeatingAlphabetArray: [Character] = []
        
        for (index, value) in occurenceArray.enumerated() {
            if value == 1 {
                let asciiValue = UInt8(index) + Character("a").asciiValue!
                notRepeatingAlphabetArray.append(Character(UnicodeScalar(asciiValue)))
            }
        }
        
        for char in string {
            if notRepeatingAlphabetArray.contains(where: {$0 == char}) {
                return char
            }
        } 
        
        return "_"
    }
    
    static func getAlphabeyOccurenceArray(_ string: String) -> [Int] {
        var table: [Int] = Array(repeating: 0, count: 26)
        let aAscii = Character("a").asciiValue!
        let zAscii = Character("z").asciiValue!

        for char in string.lowercased() {
            let ascii = char.asciiValue!
            guard aAscii <= ascii && ascii <= zAscii else {
                continue
            }
            
            let index = Int(ascii - aAscii)
            table[index] += 1
        }
        return table
    }
    
    static func test() {
        print("정답 = d 현재 풀이 값 =", findNotRepeatingFirstCharacter("abadabac"))
        print("정답 = c 현재 풀이 값 =", findNotRepeatingFirstCharacter("aabbcddd"))
        print("정답 = _ 현재 풀이 값 =", findNotRepeatingFirstCharacter("aaaaaaaa"))
    }
}

