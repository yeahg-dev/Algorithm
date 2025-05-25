//
//  FindMaxOccuredAlphabet.swift
//  Algorithm
//
//  Created by 문예지 on 5/25/25.
//

struct FindMaxOccurredAlphabet {
    
    static func findMaxOccurredAlphabet(_ string: String) -> Character {
        var table: [Int] = Array(repeating: 0, count: 26)
        let aAscii = Character("a").asciiValue!
        let zAscii = Character("z").asciiValue!
        var maxCount = 0
        var answerAscii: UInt8 = aAscii
        
        
        for char in string.lowercased() {
            let ascii = char.asciiValue!
            guard aAscii <= ascii && ascii <= zAscii else {
                continue
            }
            
            let index = Int(ascii - aAscii)
            table[index] += 1
            
            if maxCount < table[index] {
                maxCount = table[index]
                answerAscii = ascii
            }
        }
        
        return Character(UnicodeScalar(answerAscii))
    }
    
    static func test() {
        print("정답 = i 현재 풀이 값 =", findMaxOccurredAlphabet("hello my name is dingcodingco"))
        print("정답 = e 현재 풀이 값 =", findMaxOccurredAlphabet("we love algorithm"))
        print("정답 = b 현재 풀이 값 =", findMaxOccurredAlphabet("best of best youtube"))
    }
}
