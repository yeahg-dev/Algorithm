//
//  9095_123더하기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/21.
//

import Foundation

func solution9095() {
    let testCaseCount = Int(readLine()!)!
    var solutions: [Int] = Array(repeating: 0, count: 12)
    solutions[1] = 1
    solutions[2] = 2
    solutions[3] = 4
    
    for _ in 0..<testCaseCount {
        let input = Int(readLine()!)!
        print(solution(input))
    }
    
    func solution(_ number: Int) -> Int {
        if solutions[number] != 0 {
            return solutions[number]
        }
        solutions[number] = solution(number-3) + solution(number-2) + solution(number-1)
        return solutions[number]
    }
}
