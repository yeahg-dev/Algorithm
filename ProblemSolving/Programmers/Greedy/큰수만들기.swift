//
//  큰수만들기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution_makeBigNumber(_ number:String, _ k:Int) -> String {
    // 각 자리수의 가능한 범위에서 가장 큰 수 뽑기
    // 다음 자리수는 위에서 뽑은 큰 수 다음부터 범위 시작
    // 위 과정을 자리마다 반복
    let totalNumberCount = number.count
    let resultNumberCount = totalNumberCount - k
    let numbers = number.map { Int(String($0))! }
    
    var result = ""
    var startIndex = 0
    for i in 0..<resultNumberCount {
        let range = numbers[startIndex...(totalNumberCount - i)]
        let max = range.sorted().first!
        result += "\(max)"
        startIndex = range.firstIndex(of: max)!
    }
    
    return result
}
