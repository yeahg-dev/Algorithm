//
//  8958_OX퀴즈.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func totalScore(results: String) -> Int {
    var score = 0
    var scores = [Int]()
    for result in results {
        if result == "O" {
            score += 1
        } else {
            score = 0
        }
        scores.append(score)
    }
    return scores.map{Int(String($0))!}.reduce(0, +)
}

func solution8958() {
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let results = readLine()!
        print(totalScore(results: results))
    }
}
