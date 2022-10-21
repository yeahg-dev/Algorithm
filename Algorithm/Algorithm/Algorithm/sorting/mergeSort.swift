//
//  mergeSort.swift
//  Algorithm
//
//  Created by Moon Yeji on 2022/10/21.
//
// 시간복잡도: O(NlogN)

import Foundation

func mergeSort(_ list: [Int]) -> [Int] {
    if list.count <= 1 { return list}
    
    let middle: Int = list.count / 2
    let left = [Int](list[0..<middle])
    let right = [Int](list[middle..<list.count])
    return merge(left: mergeSort(list), right: mergeSort(right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var leftList = left
    var rightList = right
    var sortedList: [Int] = []
    
    while !leftList.isEmpty && !rightList.isEmpty {
        if leftList[0] < rightList[0] {
            sortedList.append(leftList.removeFirst())
        } else {
            sortedList.append(rightList.removeFirst())
        }
    }
    sortedList.append(contentsOf: leftList + rightList)
    return sortedList
}
