//
//  2775_부녀회장이될테야.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/14.
//

import Foundation

func solution2775() {
    let testCaseCount = Int(readLine()!)!
    var apart = Array(repeating: Array(repeating: 0, count: 15), count: 15)
    
    for _ in 0..<testCaseCount {
        let k = Int(readLine()!)!
        let n = Int(readLine()!)!
        print(solution(k: k, n: n))
    }
    
    for i in 0...14 {
        apart[0][i] = i
    }
    
    func solution(k: Int, n: Int ) -> Int {
        if apart[k][n] != 0 {
            return apart[k][n]
        }
        
        if k == 0 {
            return n
        } else if n == 1 {
            return 1
        } else {
            apart[k][n] = solution(k: k, n: n-1) + solution(k: k-1, n: n)
            return apart[k][n]
        }
    }
    
}
