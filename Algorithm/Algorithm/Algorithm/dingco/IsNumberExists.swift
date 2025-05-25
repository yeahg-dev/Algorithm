//
//  IsNumberExists.swift
//  Algorithm
//
//  Created by 문예지 on 5/25/25.
//

import Foundation

struct IsNumberExist {
    
    static func isNumberExist(_ number: Int, _ array: [Int]) -> Bool {
        for num in array {
            if num == number {
                return true
            }
        }
        return false
    }
    
    static func test() {
        print("정답 = true 현재 풀이 값 =", isNumberExist(3, [3, 5, 6, 1, 2, 4]))
        print("정답 = false 현재 풀이 값 =", isNumberExist(7, [6, 6, 6]))
        print("정답 = true 현재 풀이 값 =", isNumberExist(2, [6, 9, 2, 7, 1888]))
    }
}
