//
//  성격유형검사_2022kakaoInternship.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution_mbti(_ survey:[String], _ choices:[Int]) -> String{
    var mbti = ["R": 0, "T": 0,
                "C": 0, "F": 0,
                "J": 0, "M": 0,
                "A": 0, "N": 0 ]
    var result = ""
    
    for (i, s) in survey.enumerated() {
        if let score = score(choice: choices[i], survey: s) {
            let vaule = mbti[score.0]
            mbti.updateValue(score.1 + vaule!, forKey: score.0)
        }
    }
    
    if mbti["R"] == mbti["T"] {
        result += "R"
    } else {
        result += mbti["R"]! > mbti["T"]! ? "R" : "T"
    }
    if mbti["C"] == mbti["F"] {
        result += "C"
    } else {
        result += mbti["C"]! > mbti["F"]! ? "C" : "F"
    }
    if mbti["J"] == mbti["M"] {
        result += "J"
    } else {
        result += mbti["J"]! > mbti["M"]! ? "J" : "M"
    }
    if mbti["A"] == mbti["N"] {
        result += "A"
    } else {
        result += mbti["A"]! > mbti["N"]! ? "A" : "N"
    }
   
    return result
}

func score(choice: Int, survey: String) -> (String, Int)?{
    let disagree = String(survey.first!)
    let agree = String(survey.last!)
    
    if choice < 4 {
        return (disagree, 4 - choice)
    } else if choice > 4 {
        return (agree, choice - 4)
    } else {
        return nil
    }
}
