//
//  최소직사각형.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/16.
//

import Foundation

func solution_MinimumRectangle(_ sizes:[[Int]]) -> Int {
    var minimum = sizes[0]
    for size in sizes {
        minimum = minimumRectangle(minimumSize: minimum, size: size)
    }
    return minimum[0] * minimum[1]
}

func minimumRectangle(minimumSize: [Int], size: [Int]) -> [Int] {
    let reversedSize = [size[1], size[0]]
    let normal = [max(minimumSize[0], size[0]), max(minimumSize[1], size[1])]
    let reversed = [max(minimumSize[0], reversedSize[0]), max(minimumSize[1], reversedSize[1])]
    if normal[0] + normal[1] > reversed[0] + reversed[1] {
        return reversed
    } else {
        return normal
    }
}


