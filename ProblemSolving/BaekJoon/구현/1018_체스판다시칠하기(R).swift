//
//  1018_체스판다시칠하기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/13.
//

// 알고리즘 : Brute force
// 완성된 체스판(2가지 버전)과 비교
// 모든 경우의 수 비교
// 최소 값 리턴

import Foundation

func solution1018() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))}
    let rowCount = input[0]!
    let columnCount = input[1]!
    var array = [[String]]()
    var result = rowCount * columnCount

    for _ in 0..<rowCount {
        array.append(readLine()!.map{String($0)})
    }
    
    let whiteBaord = [["W", "B", "W", "B", "W", "B", "W", "B"],
                 ["B", "W", "B", "W", "B", "W", "B", "W"],
                 ["W", "B", "W", "B", "W", "B", "W", "B"],
                 ["B", "W", "B", "W", "B", "W", "B", "W"],
                 ["W", "B", "W", "B", "W", "B", "W", "B"],
                 ["B", "W", "B", "W", "B", "W", "B", "W"],
                 ["W", "B", "W", "B", "W", "B", "W", "B"],
                 ["B", "W", "B", "W", "B", "W", "B", "W"]]
    
    let blackBoard =  [["B", "W", "B", "W", "B", "W", "B", "W"],
                  ["W", "B", "W", "B", "W", "B", "W", "B"],
                  ["B", "W", "B", "W", "B", "W", "B", "W"],
                  ["W", "B", "W", "B", "W", "B", "W", "B"],
                  ["B", "W", "B", "W", "B", "W", "B", "W"],
                  ["W", "B", "W", "B", "W", "B", "W", "B"],
                  ["B", "W", "B", "W", "B", "W", "B", "W"],
                  ["W", "B", "W", "B", "W", "B", "W", "B"]]
    
    func minimumOfWhiteAndBlack(startRow: Int, startColumn: Int) -> Int{
        var white = 0
        var black = 0
        for i in 0..<8{
            for j in 0..<8{
                if whiteBaord[i][j] != array[startRow + i][startColumn + j]{
                    white += 1
                }
                if blackBoard[i][j] != array[startRow + i][startColumn + j]{
                    black += 1
                }
            }
        }
        return min(white, black)
    }

    for i in 0...rowCount-8 {
        for j in 0...columnCount-8 {
            result = min(result, minimumOfWhiteAndBlack(startRow: i, startColumn: j))
        }
    }
    
    print(result)
}
