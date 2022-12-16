//
//  2667_단지번호붙이기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution2667() {
    let n = Int(readLine()!)!
    var map = [[Int]]()
    var aparts = [Int]()
    
    for _ in 0..<n {
        map.append(readLine()!.map{Int(String($0))!})
    }
    
    for x in 0..<n {
        for y in 0..<n {
            let dfsResult = dfs(x: x, y: y)
            if dfsResult.0 == true {
                aparts.append(dfsResult.1)
            }
        }
    }
    
    print(aparts.count)
    aparts.sorted().forEach { count in
        print(count)
    }
   
    func dfs(x: Int, y: Int) -> (Bool, Int) {
        if !(0..<n).contains(x) || !(0..<n).contains(y) {
            return (false, 0)
        }
        if map[x][y] == 1 {
            map[x][y] = 0
            var count = 1
            count += dfs(x: x-1, y: y).1
            count += dfs(x: x, y: y-1).1
            count += dfs(x: x+1, y: y).1
            count += dfs(x: x, y: y+1).1
            return (true, count)
        } else {
            return (false, 0)
        }
    }
    
}
