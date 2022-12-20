//
//  1316_그룹단어체커.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/20.
//

import Foundation

func solution1316() {
    let n = Int(readLine()!)!
    var result = 0
    for _ in 0..<n{
        let word = readLine()!
        if isGroupWord(word) {
            result += 1
        }
    }
    print(result)
}


func isGroupWord(_ word: String) -> Bool {
    var alphabet = [String.Element]()
    var before = word.first!
    alphabet.append(before)
    
    if word.count == 1 {
        return true
    }
    
    for (i, w) in word.enumerated() {
        if i == 0 {
            continue
        }
        if before == w {
            before = w
            continue
        }
        if alphabet.contains(w){
            return false
        } else {
            alphabet.append(w)
            before = w
        }
    }
    
    return true
}
