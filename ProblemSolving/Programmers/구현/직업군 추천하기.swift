//
//  직업군 추천하기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/13.
//

import Foundation

// 개발자 사용 언어의 언어 선호도 * 직업군의 언어 점수의 총합이 가장 높은 직업군
func solution(table: [String], languages: [String], preference: [Int]) -> String {
    
    var jobResults = [String: Int]()
    var answer = [String]()
    
    for t in table {
        var words = t.split(separator: " ").map{String($0)}
        let job = words.removeFirst()
        var jobTable = [String: Int]()
        
        for (i, w) in words.enumerated() {
            jobTable[w] = words.count - i
        }
        var sum = 0
        for (j, language) in languages.enumerated() {
            if let value = jobTable[language] {
                sum += value * preference[j]
            }
        }
        jobResults[job] = sum
    }
    
    let maximum = jobResults.map{ $0.1 }.max()
    
    for jobResult in jobResults {
        if jobResult.value == maximum! {
            answer.append(jobResult.key)
        }
    }

    return answer.sorted().joined(separator: " ")
}
