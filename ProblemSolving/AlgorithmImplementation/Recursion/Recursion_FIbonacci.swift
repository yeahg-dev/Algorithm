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

// MARK: - Memoization
// Memoization + Dynamic programming으로 시간복잡도 개선

var result: [Int: Int] = [:]

func fibonacciWithMemoization(_ n: Int) -> Int {
    // 이미 계산한 적이 있다면, 결과값을 사용
    if let result = result[n]  {
        return result
    }
    
    if (n == 1 || n == 2) {
        return 1
    } else {
        result[n] = fibonacciWithMemoization(n-1) + fibonacciWithMemoization(n-2)
    }
    return fibonacciWithMemoization(n)
}

// MARK: - For loop

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
