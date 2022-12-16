//
//  1743_음식물피하기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution1743() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let height = input[0]
    let width = input[1]
    let garbageCount = input[2]
    var map = Array(repeating: Array(repeating: 0, count: width+1), count: height+1)
    for _ in 0..<garbageCount {
        let location = readLine()!.split(separator: " ").map{Int(String($0))!}
        map[location[0]][location[1]] = 1
    }
    
    var results = [Int]()
    
    for x in 1..<width+1 {
        for y in 1..<height+1 {
            results.append(dfs(x: x, y: y))
        }
    }
    
    func dfs(x: Int, y: Int) -> Int {
        if !(1..<width+1).contains(x) || !(1..<height+1).contains(y) {
            return 0
        }
        
        if map[y][x] == 0 {
            return 0
        } else {
            map[y][x] = 0
        }
        
        var count = 1
        count += dfs(x: x-1, y: y)
        count += dfs(x: x, y: y-1)
        count += dfs(x: x+1, y: y)
        count += dfs(x: x, y: y+1)
        return count
    }
    
    print(results.max()!)
}
