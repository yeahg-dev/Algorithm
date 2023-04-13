//
//  상호평가_위클리 챌린지.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/13.
//

import Foundation

// 각 학생들이 받은 점수의 평균 구하기

func solution(scores: [[Int]]) -> String {
    var result = ""
    let count = scores.count
    // 1. 자기 자신 평가한 점수가 유일한 최고/최저점이면 그 점수 제외하고 평균
    for (i, score) in scores.enumerated(){
        // 자신의 점수가 최저와 최고인지 확인
        let sortedScore = score.sorted()
        let maximum = sortedScore.last!
        let minimum = sortedScore.first!
        
        let isMaximumUnique = sortedScore.filter{$0 == maximum}.count == 1 ? true : false
        let isMinimumUnique = sortedScore.filter{$0 == minimum}.count == 1 ? true : false
        
        if score[i] == maximum && isMaximumUnique || score[i] == minimum && isMinimumUnique {
            result.append(String(sortedScore.reduce(0,+) - score[i]/count - 1))
        } else {
            result.append(String(sortedScore.reduce(0,+)/count))
        }
        
    }
    return result
}
