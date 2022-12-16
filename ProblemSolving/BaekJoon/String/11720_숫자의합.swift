//
//  11720_숫자의합.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution11720() {
    let n = Int(readLine()!)!
    let result = readLine()!.map {Int(String($0))!}.reduce(0){$0 + $1}
    print(result)
}
