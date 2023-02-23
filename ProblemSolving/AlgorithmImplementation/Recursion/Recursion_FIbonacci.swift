//
//  Recursion_FIbonacci.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/10/04.
//

import Foundation

// MARK: - Recursion
// 시간복잡도 : O(2^n) -> 🚨현실적으로 구할 수 없는 문제
func fibonacci(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

// MARK: - For loop with Memoization
// Memoization + Dynamic programming으로 시간복잡도 개선

func fibonacciLoop(_ n: Int) -> Int {
    var result = [0, 1, 1]
    
    if n < 3 {
        return result[n]
    }
    for i in 3..<n+1 {
        result.append(result[i-1] + result[i-2])
    }
    return result[n]
}
