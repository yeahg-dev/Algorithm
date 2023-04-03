//
//  개인정보수집유효기간_2023Blind.swift
// https://school.programmers.co.kr/learn/courses/30/lessons/150370
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/03.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayDate = KDate(today)
    var termsDict = [String: Int]()
    var result = [Int]()
    
    for string in terms {
        let array = string.components(separatedBy: " ")
        termsDict[array[0]] = Int(array[1])
    }
    
    for (n, privacy) in privacies.enumerated() {
        let privacyArray = privacy.components(separatedBy: " ")
        let startDate = KDate(privacyArray.first!)
        let rule = privacyArray.last!

        if startDate.isExpired(from: todayDate, validity: termsDict[rule]!) {
            result.append(n+1)
        }
    }
    
    return result
}

struct KDate {
    var year: Int
    var month: Int
    var day: Int

    init(_ value: String) {
        let dates = value.split(separator: ".").map{Int(String($0))}
        year = dates[0]!
        month = dates[1]!
        day = dates[2]!
    }
    
    var value: Int {
        return year*12*28 + month*28 + day
    }
    
    func isExpired(from today: KDate, validity: Int) -> Bool {
        let exipreDate = self.value + validity*28
        return exipreDate <= today.value ?  true : false
    }
}
