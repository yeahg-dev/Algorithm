//
//  10773_제로.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/23.
//

import Foundation

func solution10773() {
    let k = Int(readLine()!)!
    var numbers = [Int]()
    
    for _ in 0..<k {
        let n = Int(readLine()!)!
        if n != 0 {
            numbers.append(n)
        } else {
            numbers.removeLast()
        }
    }
    
    print(numbers.reduce(0, +))
}
