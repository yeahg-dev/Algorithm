//
//  DartGame_kakao2018blind.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/04.
//

import Foundation

// 다트 3번 -> 점수 합
// 0 ~ 10점
// S D T
// * : (이전+지금)*2 , # : -지금 점수
// 점수, 보너스, 옵션

// 정답 : 총점수

func solution(_ dartResult:String) -> Int {
    // 결과를 분할 (숫자로)
    // 1,2,3차 점수
    // 3회차를 돌면서
    // 1) 보너스 계산
    // 2) 옵션 계산
    let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})

    let results = zip(numberList, letterList)
    
    var totalScore = 0
    for (i, (value, letter)) in results.enumerated() {
        var value = Int(String(value)) ?? 0
        
        if letter.contains("D") {
            value *= value
        } else if letter.contains("T"){
            value *= value * value
        }

        if letter.contains("*") {
             value *= 2
        } else if letter.contains("#"){
            value *= (-1)
        }
        
        if i != 2 && letterList[i + 1].contains("*") {
            value *= 2
        }
        totalScore += value
    }
    return totalScore
}

