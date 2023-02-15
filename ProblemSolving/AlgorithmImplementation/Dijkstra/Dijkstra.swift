//
//  Dijkstra.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/02/15.
//

import Foundation

// MARK: - 구현 방법 1️⃣

// 다음 노드 탐색: 선형 탐색으로 구현
//    - 시간복잡도: O(N^2)
//    - 쉬운 방법이지만, 노드 개수에 비해 간선의 개수가 적을 때 비효율적
 
private let number = 6 // 노드 개수
private let inf = 1000000000 // 무한 비용

// 전체 그래프를 초기화
private let graph: [[Int]] = [[0, 2, 5, 1, inf, inf],
                              [2, 0, 3, 2, inf, inf],
                              [5, 3, 0, 3, 1, 5],
                              [1, 2, 3, 0, 1, inf],
                              [inf, inf, 1, 1, 0, 2],
                              [inf, inf, 5, inf, 2, 0]]

// 방문한 노드 확인
private var visited = Array(repeating: false, count: 6)
// 최단 거리 저장 배열
private var distance = Array(repeating: 0, count: 6)

// 방문하지 않는 노드 중 최소 거리를 가지는 노드를 반환
private func getSmallestNode() -> Int {
    var minimum = inf
    var node = 0
    for i in 0..<number {
        if distance[i] < minimum && !visited[i] {
            minimum = distance[i]
            node = i
        }
    }
    return node
}

// 다익스트라 수행
func dijkstra(start: Int) {
    // 연결된 모든 노드로 가는 비용으로 최초 세팅
    for i in 0..<number {
        distance[i] = graph[start][i]
    }
    visited[start] = true
    for _ in 0..<number-2 {
        let currentNode = getSmallestNode()
        visited[currentNode] = true
        for j in 0..<number {
            if !visited[j] {
                if (distance[currentNode] + graph[currentNode][j]) < distance[j] {
                    distance[j] = distance[currentNode] + graph[currentNode][j]
                }
            }
        }
    }
}
