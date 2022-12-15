//
//  main.swift
//  algorithm-practice
//
//  Created by 1 on 2022/02/03.
//

import Foundation

func main() {
    var numbers = [Int]()
    
    for _ in 0..<9 {
        let number = Int(readLine()!)!
        numbers.append(number)
    }
    
    let max = numbers.max()!
    let index = numbers.firstIndex(of: max)! + 1
    
    print(max, index, separator: "\n")
}

main()

print(solution("1S2D*3T"))
