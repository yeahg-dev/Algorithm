//
//  DartGame_kakao2018blind.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/04.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    
    var scores = [Int]()
    var bonuses = dartResult.filter { char in
        char == "S" || char == "D" || char == "T"
    }
    var stars = [Character]()
    var achars = [Character]()
    
    let scoresAndOption = dartResult.components(separatedBy: ["S", "D", "T"])
    for (i, block) in scoresAndOption.enumerated() {
        var blockCopy = block
        if block.contains("*") && block.contains("#") {
            stars[i-1] = blockCopy.removeFirst()
            achars[i-1] = blockCopy.removeFirst()
            guard let score = Int(blockCopy) else {
                continue
            }
            scores[i] = score
        } else if block.contains("#") {
            achars[i-1] = blockCopy.removeFirst()
            guard let score = Int(blockCopy) else {
                continue
            }
            scores[i] = score
        } else if block.contains("*") {
            stars[i-1] = blockCopy.removeFirst()
            guard let score = Int(blockCopy) else {
                continue
            }
            scores[i] = score
        } else {
            scores[i] = Int(block)!
        }
    }
    
    for (i, bonus) in bonuses.enumerated() {
        if bonus == "D" {
            let bonusedScore = Int(pow(Float(scores[i]), Float(i)))
            scores[i] = bonusedScore
        } else if bonus == "T" {
            let bonusedScore = Int(pow(Float(scores[i]), Float(i)))
            scores[i] = bonusedScore
        }
    }
    
    for (i, _) in stars.enumerated() {
        if i == 0 {
            scores[0] *= 2
        } else {
            scores[i-1] *= 2
            scores[i] *= 2
        }
    }
    
    for (i, _) in achars.enumerated() {
        scores[i] = -1 * scores[i]
    }
    
    return scores.reduce(0, +)
}
