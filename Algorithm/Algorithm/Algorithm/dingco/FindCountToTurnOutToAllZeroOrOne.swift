//
//  FindCountToTurnOutToAllZeroOrOne.swift
//  Algorithm
//
//  Created by 문예지 on 5/27/25.
//

import Foundation

struct FindCountToTurnOutToAllZeroOrAllOne {
    
    static func findCountToTurnOutToAllZeroOrAllOne(_ string: String) -> Int {
        // 연속된 0의 개수와 연속된 1의 개수를 비교해서 더 작은 개수만큼 뒤집는다
        var target = string
        var currentNum = target.removeFirst()
        var oneBundleCount = 0
        var zeroBundleCount = 0
        
        for char in target {
            guard currentNum != char else {
                continue
            }
            if (currentNum == "0") {
                zeroBundleCount += 1
            } else {
                oneBundleCount += 1
            }
            currentNum = char
        }
        return min(oneBundleCount, zeroBundleCount)
    }
    
    static func test() {
        let result = findCountToTurnOutToAllZeroOrAllOne("011110")
        print(result)
    }
}
