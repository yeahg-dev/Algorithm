//
//  14889_스타트와 링크.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/04.
//

import Foundation

func solution14889(){
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    var visited = Array(repeating: false, count: n)
    for _ in 0..<n {
        arr.append(readLine()!.split(separator: " ").map({ Int(String($0))! }))
    }
    var result = 9999999999
    var team1 = 0
    var team2 = 0
    
    func dfs(depth: Int, start: Int) {
        if depth == n/2 {
            team1 = 0
            team2 = 0
            for i in 0..<n {
                for j in 0..<n {
                    if !visited[i] && !visited[j] {
                        team2 += arr[i][j]
                    }
                    if visited[i] && visited[j] {
                        team1 += arr[i][j]
                    }
                }
            }
            result = min(result, abs(team2 - team1))
        }
        
        for i in start..<n {
            if !visited[i] {
                visited[i] = true
                dfs(depth: depth + 1, start: i)
                visited[i] = false
            }
        }
    }
    
    dfs(depth: 0, start: 0)
    print(result)
}
