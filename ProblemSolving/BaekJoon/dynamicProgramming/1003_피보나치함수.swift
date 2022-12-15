//
//  1003_피보나치함수.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/14.
//

import Foundation

func solution1003() {
    let count = Int(readLine()!)!
    var fibonacchi = Array(repeating: (0,0), count: 41)
    
    for _ in 0..<count {
        let n = Int(readLine()!)!
        let sol = solution(n)
        print("\(sol.0) \(sol.1)")
    }
    
    func solution(_ n: Int) -> (Int, Int) {
        if fibonacchi[n] != (0,0) {
            return fibonacchi[n]
        }
        if n == 0 {
            fibonacchi[0] = (1, 0)
            return (1, 0)
        } else if n == 1 {
            fibonacchi[1] = (0, 1)
            return (0, 1)
        }
        let minusOne = solution(n-1)
        let minusTwo = solution(n-2)
        fibonacchi[n] = (minusOne.0 + minusTwo.0, minusOne.1 + minusTwo.1)
        return fibonacchi[n]
    }

}
