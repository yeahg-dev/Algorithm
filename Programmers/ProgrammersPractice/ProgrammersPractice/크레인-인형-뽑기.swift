//
//  크레인-인형-뽑기.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/21.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var numberOfDisappear = 0
    var dollColumns: [[Int]] = [[Int]](repeating: [Int](), count: board[0].count)
    // enumerated로 인덱스와 인형(Int)를 순회
    for (_, row) in board.reversed().enumerated() {
        for (column, doll) in row.enumerated() {
            if doll != 0 {
                dollColumns[column].append(doll)
            }
        }
    }
    let initialBasket: [Int] = []
    let _ = moves.reduce(initialBasket){ basket, crainNumber in
        var currentBasket = basket
        // 아무것도 없는 경우 고려
        guard let doll = dollColumns[crainNumber-1].popLast() else {
            return currentBasket
        }
        let lastDoll = currentBasket.last
        if lastDoll == doll {
            numberOfDisappear += 2
            currentBasket.removeLast()
            return currentBasket
        } else {
            currentBasket.append(doll)
            return currentBasket
        }
    }
    return numberOfDisappear
}
