//
//  11399_ATM.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/14.
//

import Foundation

func solution11399() {
    let n = Int(readLine()!)!
    let waitings = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    let total = waitings.enumerated().reduce(0) { partialResult, waitingTime in
        return partialResult + waitingTime.element * (n - waitingTime.offset)
    }
    print(total)
}
