//
//  11047_동전0.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/14.
//

import Foundation

func solution11047() {
    let input = readLine()!.split(separator: " ").map {Int(String($0))}
    let n = input[0]!
    var k = input[1]!
    var coins = [Int]()
    var result = 0
    
    for _ in 0..<n {
        coins.append(Int(readLine()!)!)
    }
    
    for coin in coins.reversed() {
        result += k/coin
        k %= coin
    }
    print(result)
}
