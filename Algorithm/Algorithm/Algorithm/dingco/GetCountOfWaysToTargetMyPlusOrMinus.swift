//
//  GetCountOfWaysToTargetMyPlusOrMinus.swift
//  Algorithm
//
//  Created by 문예지 on 6/7/25.
//

import Foundation

struct GetCountOfWaysToTargetByDoingPlusOrMinus {
    
    static func getCountOfWaysToTargetByDoingPlusOrMinus(_ array: [Int], _ target: Int) -> Int {
        var results: [Int] = []
        var way = 0
        calculate(currentSum: 0, currentIndex: 0, array: array)
        for result in results {
            if result == target {
                way += 1
            }
        }
        
        func calculate(currentSum: Int, currentIndex: Int, array: [Int]) {
            if (currentIndex == array.count)
            {
                results.append(currentSum)
                return
            }
            calculate(currentSum: currentSum + array[currentIndex], currentIndex: currentIndex + 1, array: array)
            calculate(currentSum: currentSum - array[currentIndex], currentIndex: currentIndex + 1, array: array)
        }
        
        return way
    }
    
    
    static func test() {
        let numbers = [1, 1, 1, 1, 1]
        let targetNumber = 3
        
        let result = getCountOfWaysToTargetByDoingPlusOrMinus(numbers, targetNumber)
        print("정답 = 5 현재 풀이 값 =", result)
    }
}
