//
//  2738_행렬덧셈.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/02/05.
//

import Foundation

// N(열), M(행) 파악
// A, B 만들기
// 결과 출력 (열별 덧셈 * 행번 반복)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input.first!
let m = input.last!

let a = dim(column: n, row: m)
let b = dim(column: n, row: m)

// arraySum(a: a, b: b, n: n, m: m)

func dim(column n: Int, row m: Int ) -> [[Int]] {
    var array = [[Int]]()
    for y in 0..<n {
        let column = readLine()!.split(separator: " ").map { Int(String($0))! }
        array.append(column)
    }
    return array
}

func arraySum(a: [[Int]], b: [[Int]], n: Int, m: Int) {
    for y in 0..<n {
        var sum = [Int]()
        for x in 0..<m {
            sum.append(a[y][x] + b[y][x])
        }
        print(sum.map{String($0)}.joined(separator: " "))
    }
}
