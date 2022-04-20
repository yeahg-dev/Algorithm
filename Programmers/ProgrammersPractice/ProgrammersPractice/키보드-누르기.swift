//
//  키보드-누르기.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/20.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let mainHand: String = hand == "left" ? "L" : "R"
    let numberLocation: [[Int]] = [[3,1], [0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
    
    var lastLeft: [Int] = [3, 0]
    var lastRight: [Int] = [3, 2]
    
    let handResult = numbers.map{
        if $0 == 1 || $0 == 4 || $0 == 7 {
            lastLeft = numberLocation[$0]
            return "L"
        } else if $0 == 3 || $0 == 6 || $0 == 9  {
            lastRight = numberLocation[$0]
            return "R"
        } else {
            let targetLoc = numberLocation[$0]
            let leftDistance = abs(targetLoc[0] - lastLeft[0]) + abs(targetLoc[1] - lastLeft[1])
            let rightDistance = abs(targetLoc[0] - lastRight[0]) + abs(targetLoc[1] - lastRight[1])
            if leftDistance > rightDistance {
                lastRight = numberLocation[$0]
                return "R"
            } else if rightDistance > leftDistance {
                lastLeft = numberLocation[$0]
                return "L"
            } else {
                if mainHand == "L" {
                    lastLeft = numberLocation[$0]
                } else {
                    lastRight = numberLocation[$0]
                }
                return mainHand
            }
        }
    }.joined()
    return handResult
}
