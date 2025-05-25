//
//  FindMac.swift
//  Algorithm
//
//  Created by 문예지 on 5/22/25.
//

import Foundation

struct FindMaxNum {
    
    static func solution(_ array: [Int]) -> Int {
        var maxNum = array[0]
        for num in array {
            if num > maxNum {
                maxNum = num
            }
        }
        return maxNum
    }

    static func test() {
        print("정답 = 6 / 현재 풀이 값 = \(solution([3, 5, 6, 1, 2, 4]))")
        print("정답 = 6 / 현재 풀이 값 = \(solution([6, 6, 6]))")
        print("정답 = 1888 / 현재 풀이 값 = \(solution([6, 9, 2, 7, 1888]))")
    }
}
