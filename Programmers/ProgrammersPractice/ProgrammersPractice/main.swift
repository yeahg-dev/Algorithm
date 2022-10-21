//
//  main.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/05/26.
//

import Foundation

func news(_ str1:String, _ str2:String) -> Int {
    // 전부 소문자로 변환
    let lowerStr1 = str1.lowercased()
    let lowerStr2 = str2.lowercased()
    // 두글자씩 분할
    // 숫자,공백,특수문자 쌍 버리기
    let str1Elements = lowerStr1.enumerated().map{ (char) -> String in
        if char.offset == lowerStr1.count - 1 {
            return ""
        }
        let nextIndex = lowerStr1.index(lowerStr1.startIndex, offsetBy: char.offset + 1)
        return String(char.element) + String(lowerStr1[nextIndex])
    }.filter { if $0.count == 2 {
        return "a"..."z" ~= $0.first! || "a"..."z" ~= $0.last!
    }
        return false}
    let str2Elements = lowerStr2.enumerated().map{ (char) -> String in
        if char.offset == lowerStr2.count - 1 {
            return ""
        }
        let nextIndex = lowerStr2.index(lowerStr2.startIndex, offsetBy: char.offset + 1)
        return String(char.element) + String(lowerStr2[nextIndex])
    }.filter { if $0.count == 2 {
        return $0.first!.isLetter && $0.last!.isLetter
    }
        return false}
    
    let str1Set = Set(str1Elements)
    let str2Set = Set(str2Elements)

    // 교집합 구하기
    let duplicationCount = str1Set.intersection(str2Set).count

    // 0 예외 처리
    // 합집합 = A + B - 교집합
    let str1Count = str1Set.count
    let str2Count = str2Set.count

    let all = str1Count + str2Count - duplicationCount

    if str1Count == 0 || str2Count == 0 {
        return 65536
    } else {
        // 나눗셈은 Double만 가능
        let result = Double(duplicationCount) / Double(all) * 65536
        return Int(floor(result))
    }

}

print(news("FRANCE", "french"))

let fruits: Set = ["tomato", "strawberry", "lemon", "peach"]
let begetables: Set = ["tomato", "basil", "olive", "cucumber"]
let bothFruitAndBegetable = fruits.intersection(begetables)
print(bothFruitAndBegetable)
// Prints "["tomato"]"

func isAlphabet(_ char: Character) -> Bool {
    "A"..."Z" ~= char || "a"..."z" ~= char
}

print(isAlphabet("c"))
