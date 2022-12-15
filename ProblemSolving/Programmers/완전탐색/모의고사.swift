//
//  모의고사.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/15.
//

import Foundation

 func answerCount(answers: [Int], myAnswers: [Int]) -> Int {
        var answerCount = 0
        for (i, answer) in answers.enumerated() {
            if answer == myAnswers[i] {
                answerCount += 1
            }
        }
        return answerCount
    }

func solution(_ answers:[Int]) -> [Int] {
    let problemCount = answers.count
    let oneRepeat = Int(ceil(Double(problemCount)/5))
    let twoRepeat = Int(ceil(Double(problemCount)/8))
    let threeRepeat = Int(ceil(Double(problemCount)/10))
      
    // 수포자의 정답
    var one = [Int]()
    var two = [Int]()
    var three = [Int]()
    
    for _ in 0..<oneRepeat {
        one += [1, 2, 3, 4, 5]
    }
    for _ in 0..<twoRepeat {
        two += [2, 1, 2, 3, 2, 4, 2, 5]
    }
    for _ in 0..<threeRepeat {
        three += [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    }
  
    var results = [(1, 0), (2, 0), (3, 0)]
    // 점수 계산
    results[0].1 = answerCount(answers: answers, myAnswers: one)
    results[1].1 = answerCount(answers: answers, myAnswers: two)
    results[2].1 = answerCount(answers: answers, myAnswers: three)
    
    // 오름차순으로 정렬해서 리턴
    let max = results.map{$0.1}.max()
    return results.filter{$0.1 == max}.sorted(by: { $0.1 < $1.1} ).map{$0.0}
}
