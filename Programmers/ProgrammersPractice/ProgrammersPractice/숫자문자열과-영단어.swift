//
//  숫자문자열과-영단어.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/18.
//


import Foundation

// 🚀 전략1️⃣
// 1. 첫글자가 숫자라면 결과에 숫자를 추가한다
// 2. 첫글자가 숫자가 아니라면 앞에서부터 3글자를 추출하여 매치되는 숫자를 결과에 추가한다
// 3. O(n)의 removeSubrange대신 미확인 문자열을 교체하는 방식을 사용한다

func solution(_ s:String) -> Int {
    
    var givenString = s
    var result = ""
    
    while givenString != "" {
        let startIndex: String.Index = givenString.startIndex
        
        if givenString.first!.isNumber {
            result += String(givenString.first!)
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 1)..<givenString.endIndex])
            continue
        }
        
        let range = startIndex ..< givenString.index(startIndex, offsetBy: 3)
        let num = givenString[range]
        switch num {
            case "zer":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 4)..<givenString.endIndex])
            result += "0"
            case "one":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 3)..<givenString.endIndex])
            result += "1"
            case "two":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 3)..<givenString.endIndex])
            result += "2"
            case "thr":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 5)..<givenString.endIndex])
            result += "3"
            case "fou":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 4)..<givenString.endIndex])
            result += "4"
            case "fiv":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 4)..<givenString.endIndex])
            result += "5"
            case "six":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 3)..<givenString.endIndex])
            result += "6"
            case "sev":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 5)..<givenString.endIndex])
            result += "7"
            case "eig":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 5)..<givenString.endIndex])
            result += "8"
            case "nin":
            givenString = String(givenString[givenString.index(startIndex, offsetBy: 4)..<givenString.endIndex])
            result += "9"
            default:
            continue
        }
    }
    
    return Int(result)!
}

// 🚀 전략2️⃣
// replacingOccurrences(of:,with:)사용
func solution2(_ s:String) -> Int {
    
    var givenString = s
    
    givenString = givenString.replacingOccurrences(of: "zero", with: "0")
    givenString = givenString.replacingOccurrences(of: "one", with: "1")
    givenString = givenString.replacingOccurrences(of: "two", with: "2")
    givenString = givenString.replacingOccurrences(of: "three", with: "3")
    givenString = givenString.replacingOccurrences(of: "four", with: "4")
    givenString = givenString.replacingOccurrences(of: "five", with: "5")
    givenString = givenString.replacingOccurrences(of: "six", with: "6")
    givenString = givenString.replacingOccurrences(of: "seven", with: "7")
    givenString = givenString.replacingOccurrences(of: "eight", with: "8")
    givenString = givenString.replacingOccurrences(of: "nine", with: "9")
    
    return Int(givenString)!
}
