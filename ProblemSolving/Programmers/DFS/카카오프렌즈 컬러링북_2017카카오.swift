//
//  카카오프렌즈 컬러링북_2017카카오.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/13.
//

import Foundation

// 영역의 개수
// 가장 큰 영역

// 모든 노드를 탐색하며
// 방문하지 않았다면
// 같은 색깔이면
// 크기 + 1
// 다른 색깔이면
// 크기를 return

// m 높이, n 넓이

func solution(m: Int, n: Int, picture:[[Int]]) -> [Int] {
    var areaCount = 0
    var maximumSize = 0
    var needToVisit = [(x: Int, y: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var size = 0
    
    for i in 0..<m {
        for j in 0..<n {
            if picture[i][j] > 0 && visited[i][j] == false {
                size = 1
                bfs(x: j, y: i, color: picture[i][j])
                areaCount += 1
                maximumSize = max(size, maximumSize)
            }
        }
    }
    
    func bfs(x: Int, y: Int, color: Int) {
        needToVisit.append((x,y))
        
        while !needToVisit.isEmpty {
            let node = needToVisit.removeFirst()
            visited[y][x] = true
            
            for w in 0..<4 {
                for z in 0..<4 {
                    let nx = node.0 + dx[w]
                    let ny = node.1 + dy[z]
                    
                    if (0..<n).contains(nx) && (0..<m).contains(ny) {
                        if color == picture[ny][nx] && visited[ny][nx] == false{
                            visited[ny][nx] = true
                            size += 1
                            needToVisit.append((nx, ny))
                        }
                    }
                }
            }
            
        }
    }
  
    
    return [areaCount, maximumSize]
}
