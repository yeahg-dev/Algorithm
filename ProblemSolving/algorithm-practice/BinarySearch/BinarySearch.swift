//
//  BinarySearch.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/10/04.
//
// Binary Search Example : 배열에 특정 숫자 있는지 서칭
// 방식: 중간을 기준으로 반씩 나누어 탐색
// 조건: 정렬된 상태
// 시간복잡도: O(log2N)

import Foundation

class BinarySearch {
    
    // 배열에 target이 존재 하면 true
    func binarySearchRecursive(
        array: [Int],
        target: Int,
        left: Int,
        right: Int)
    -> Bool
    {
        if left > right {
            return false
        }
        
        let midIndex: Int = (left + right) / 2
        // let midIndx = left + (right - left) / 2
        
        // mid가 target인지
        if array[midIndex] == target {
            return true
            // mid가 target보다 작은 경우
        } else if target < array[midIndex] {
            return binarySearchRecursive(
                array: array,
                target: target,
                left: left,
                right: midIndex - 1)
            // mid가 target보다 큰 경우
        } else {
            return binarySearchRecursive(
                array: array,
                target: target,
                left: midIndex - 1,
                right: right)
        }
    }
    
    func binarySearchIterative(
        array: [Int],
        target: Int)
    -> Bool
    {
        var leftIndex = 0
        var rightIndex = array.count - 1
       
       // 🏁 flag
        while leftIndex <= rightIndex {
            let midIndex: Int = (leftIndex + rightIndex) / 2
            // let midIndx = left + (right - left) / 2 ) : Index Out of Range 방지
            
            if array[midIndex] == target {
                return true
            } else if target < array[midIndex] {
                rightIndex = midIndex - 1
                return binarySearchIterative(
                    array: array,
                    target: target)
            } else {
                leftIndex = midIndex + 1
                return binarySearchIterative(
                    array: array,
                    target: target)
            }
        }
        return false
    }
}
