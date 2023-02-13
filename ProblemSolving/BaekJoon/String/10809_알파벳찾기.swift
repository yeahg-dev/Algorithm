//
//  10809_알파벳 찾기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/02/13.
//

import Foundation

func solution10809() {
    let word = readLine()!
    var result = Array(repeating: -1, count: 26)
    
    for (i, char) in word.enumerated() {
        let index = Int(UnicodeScalar(String(char))!.value - UnicodeScalar("a").value)
        if result[index] == -1 {
            result[index] = i
        } else {
            continue
        }
    }
    
    print(result.map{String($0)}.joined(separator: " "))
}
