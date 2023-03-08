//
//  1932_정수삼각형.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/03/09.
//

import Foundation

func solution1932() {
    let n = Int(readLine()!)!
    var triangle = [[Int]]()
    for _ in 0..<n {
        triangle.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    // 1부터 시작
    for i in 1..<n {
        for g in 0..<i+1 {
            if g == 0 {
                triangle[i][g] += triangle[i-1][0]
            } else if g == i {
                triangle[i][g] += triangle[i-1][g-1]
            } else {
                triangle[i][g] += max(triangle[i-1][g-1], triangle[i-1][g])
            }
        }
    }
    
    print(triangle[n-1].max()!)
}

func solution1932B() {
    let n = Int(readLine()!)!
    var triangle = [[Int]]()
    for _ in 0..<n {
        triangle.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    guard n != 1 else {
        print(triangle[0][0])
        return
    }
    
    print(getMax(acc: triangle[0][0], index: 0, height: 1))
    
    func getMax(acc: Int, index: Int, height: Int) -> Int {
        var maxValue: Int = acc
        var currentIndex: Int = index
        
        guard height != n else {
            return maxValue
        }
        
        for m in height..<n {
            let left = triangle[m][currentIndex]
            let right = triangle[m][currentIndex+1]
            if left > right {
                currentIndex = left
                maxValue += left
            } else if right > left {
                currentIndex = right
                maxValue += right
            } else {
                let leftMax = getMax(acc: maxValue, index: currentIndex, height: m+1)
                let rightMax = getMax(acc: maxValue, index: currentIndex+1, height: m+1)
                maxValue = max(leftMax, rightMax)
                break
            }
        }
        return maxValue
    }
}
