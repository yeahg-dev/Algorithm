//
//  2566_최댓값.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/03/07.
//

import Foundation

func solution2566() {
    var nums = [[Int]]()
    for _ in 0..<9 {
        nums.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    var r = 0
    var c = 0
    var max = 0
    
    for row in 0..<9 {
        for column in 0..<9 {
            let number = nums[row][column]
            if number > max {
                max = number
                r = row
                c = column
            }
        }
    }
    
    print(max)
    print((r+1), (c+1))
}
