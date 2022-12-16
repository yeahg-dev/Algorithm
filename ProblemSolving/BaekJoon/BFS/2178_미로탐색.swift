//
//  2178_미로탐색.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution2178() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let height = input[0]
    let width = input[1]
    
    var maze = [[Int]]()
    
    for _ in 0..<height {
        maze.append(readLine()!.map{Int(String($0))!})
    }
    
    var queue: [(y: Int, x: Int)] = [(0, 0)]
    var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    
    let dx: [Int] = [1, -1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    distance[0][0] = 1
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let previousDistance = distance[node.y][node.x]
        
        for i in 0..<4 {
            let y = node.y + dy[i]
            let x = node.x + dx[i]
            
            if (0..<width).contains(x) && (0..<height).contains(y) && maze[y][x] == 1 {
                distance[y][x] = previousDistance + 1
                queue.append((y, x))
                maze[y][x] = 0
                
                if x == width - 1 && y == height - 1 {
                    print(distance[height-1][width-1])
                    break
                }
            }
        }
    }
}
