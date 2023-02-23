//
//  10872_팩토리얼.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/02/23.
//

import Foundation

// n에서 1씩 줄여가며 0이 될 때까지 곱셈을 반복한다.
func solution10872() {
    let n = Int(readLine()!)!
    
    print(factorial(n: n))
    
    
    func factorial(n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return n * factorial(n: n-1)
    }
}
