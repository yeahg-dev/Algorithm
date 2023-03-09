//
//  1904_01타일.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/03/09.
//

// 🤓 배열을 사용하지 않고 필요한 값들을 변수에 임시로 저장해서 업데이트하여 쓰는 방법도 있다

import Foundation

func solution1904() -> Int {
    let n = Int(readLine()!)!
    
    var twoBefore: Int = 1
    var oneBefore: Int = 2
    
    if n == 1 {
        return twoBefore
    } else if n == 2 {
        return oneBefore
    } else {
        var result = 0
        for _ in 3...n {
            result = (twoBefore + oneBefore) % 15746
            twoBefore = oneBefore % 15746
            oneBefore = result
        }
        return result
    }
}
