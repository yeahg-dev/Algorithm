//
//  실패율.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/21.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageRate: [Int] = [Int](repeating: 0, count: N + 1)
    for stage in stages {
        for i in 0..<stage {
            stageRate[i] += 1
        }
    }
    
    var result = [Int: Double]()
    for i in 0..<N {
        if Double(stageRate[i]) == 0 {
            result.updateValue(0, forKey:i+1)
            continue
        }
        let rate = Double(stageRate[i] - stageRate[i+1]) / Double(stageRate[i])
        result.updateValue(rate, forKey:i+1)
    }
    
    // 실패율 높은 스테이지부터 sort
    let stageResult = result.sorted{
                                    if $0.1 != $1.1 {
                                    return $0.1 > $1.1
                                    }
                                    return $0.0 < $1.0}.map{$0.0}
    // let stageResult = result.sorted(by: <).sorted(by: {$0.1 > $1.1}).map{$0.0}
    return stageResult
}
