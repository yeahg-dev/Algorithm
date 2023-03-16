//
//  7568_덩치.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/03/16.
//

import Foundation

func solution7568() -> [Int] {
    let n = Int(readLine()!)!
    var people = [(Int, Int)]()
    var result = [Int]()
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        people.append((input[0], input[1]))
    }
    
    for (i, person) in people.enumerated() {
        var rank = 1
        for (j, comparsion) in people.enumerated() {
            guard i != j else {
                continue
            }
            if person.0 < comparsion.0 && person.1 < comparsion.1 {
                rank += 1
            }
        }
        result.append(rank)
    }
    
    return result
}

//for i in solution7568() {
//    print(i, terminator: " ")
//}
