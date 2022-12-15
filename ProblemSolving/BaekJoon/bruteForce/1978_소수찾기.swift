//
//  1978_소수찾기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/14.
//

import Foundation

// 🚨 틀림
func solution1978() {
    let _ = Int(readLine()!)!
    let numbers = Set(readLine()!.split(separator:" ").map{Int($0)!})
    var result = 0
    for number in numbers {
        if number == 1 {
            // 1은 소수가 아님
            continue
        } else if isPrimeNumber(number) == true {
            result += 1
        }
    }
    print(result)
}

func isPrimeNumber(_ number: Int) -> Bool {
    let num = sqrt(Double(number))
    for i in 2...Int(num) {
        if number % i == 0 {
            return false
        }
    }
    return true
}
