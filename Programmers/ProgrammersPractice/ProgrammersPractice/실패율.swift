//
//  실패율.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/21.
//

import Foundation

// 🚨 시간초과 남

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // 각 스테이지에 대한 실패율 계산
    // 스테이지 == 유저/유저 <= 스테이지
    let stageContainer: [Int] = Array(1...N)
    let result: [(Int, Double)] = stageContainer.map{(stage: Int) -> (Int, Double) in
        let plyersYetClear: Int = stages.filter{$0 == stage}.count
        let playersOnStage: Int = stages.filter{$0 >= stage}.count
        if playersOnStage == 0 {
            return (stage, 0)
        }
        let failureRate = Double(plyersYetClear) / Double(playersOnStage)
        return (stage, failureRate)
    }
    // 실패율 높은 스테이지부터 sort
    let stageResult = result.sorted{
                                    if $0.1 != $1.1 {
                                    return $0.1 > $1.1
                                    }
                                    return $0.0 < $1.0}.map{$0.0}
    
//    let stageResult = result.sorted(by: <).sorted(by: {$0.1 > $1.1}).map{$0.0}
    return stageResult
}
