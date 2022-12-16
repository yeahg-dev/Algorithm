//
//  1012_유기농배추.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution1012() {
    let testCaseCount = Int(readLine()!)!
    
    for _ in 0..<testCaseCount {
       print(solution())
    }
    
    func solution() -> Int {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let width = input[0]
        let height = input[1]
        let cabbageCount = input[2]
        var map = Array(repeating: Array(repeating: 0, count: width), count: height)
        for _ in 0..<cabbageCount {
            let location = readLine()!.split(separator: " ").map{Int(String($0))!}
            map[location[1]][location[0]] = 1
        }
        var neededWormCount = 0
        
        for y in 0..<height  {
            for x in 0..<width {
                if bfs(startX: x, startY: y) == true {
                    neededWormCount += 1
                }
            }
        }
        
        func bfs(startX: Int, startY: Int) -> Bool {
            var queue: [(x: Int, y: Int)] = []
            let dx: [Int] = [1, -1, 0, 0]
            let dy: [Int] = [0, 0, -1, 1]
            var result = false
            
            queue.append((startX, startY))
            if map[startY][startX] == 1 {
                result = true
            } else {
                return false
            }
            while !queue.isEmpty {
                let node = queue.removeFirst()
                for i  in 0..<4 {
                    let px = node.x + dx[i]
                    let py = node.y + dy[i]
                    if (0..<width).contains(px) && (0..<height).contains(py) && map[py][px] == 1 {
                        result = true
                        map[py][px] = 0
                        queue.append((px, py))
                    }
                }
            }
            return result
        }
        
        return neededWormCount
    }

}
