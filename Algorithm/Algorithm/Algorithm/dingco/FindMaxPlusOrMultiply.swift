//
//  FindMaxPlusOrMultiply.swift
//  Algorithm
//
//  Created by 문예지 on 5/25/25.
//

import Foundation

struct FindMaxPlusOrMultiply {
    
    static func findMaxPlusOrMultiply(_ array: [Int]) -> Int {
        var leftOperand = 0
        
        for num in array {
            if num <= 1 || leftOperand <= 1 {
                leftOperand = leftOperand + num
            } else {
                leftOperand = leftOperand * num
            }
        }
    
        return leftOperand
    }
    
    static func test() {
        print("정답 = 728 현재 풀이 값 =", findMaxPlusOrMultiply([0, 3, 5, 6, 1, 2, 4]))
        print("정답 = 8820 현재 풀이 값 =", findMaxPlusOrMultiply([3, 2, 1, 5, 9, 7, 4]))
        print("정답 = 270 현재 풀이 값 =", findMaxPlusOrMultiply([1, 1, 1, 3, 3, 2, 5]))
    }
}
