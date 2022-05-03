//
//  main.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/05/03.
//

import Foundation

func secretMap(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
   
    // 비트연산을 수행한 후 n개의 비트배열이 되도록 조정
    var resultArr: [[Character]] = []
    arr1.enumerated().forEach { (index, value) in
        let result = value | arr2[index]
        var bitArr = Array(String(result, radix: 2))
        while bitArr.count < n {
            bitArr.insert("0", at: 0)
        }
        resultArr.append(bitArr)
    }
    
    // 문자열 배열로 변환
    let answer = resultArr.map{$0.map{if $0 == "1" {
        return "#"
    } else {
      return " "
    }}.joined()}
    
    return answer
}

