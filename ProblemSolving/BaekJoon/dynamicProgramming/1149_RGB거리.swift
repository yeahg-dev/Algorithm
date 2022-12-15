//
//  1149_RGB거리.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/15.
//

import Foundation

func solution1149() {
    let n = Int(readLine()!)!
    var prices = Array(repeating: [0, 0, 0], count: n+1)
    for i in 1..<n+1 {
        prices[i] = readLine()!.split(separator: " ").map {Int(String($0))!}
    }
    
    // dp[집번호][색상] = 가격
    var dp = Array(repeating: [0, 0, 0], count: n+1)
    
    for i in 1..<n+1 {
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + prices[i][0]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + prices[i][1]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + prices[i][2]
    }
    
    print(dp[n].min()!)
}
