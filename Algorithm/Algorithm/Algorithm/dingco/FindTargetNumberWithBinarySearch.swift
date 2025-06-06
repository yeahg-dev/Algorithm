//
//  FindTargetNumberWithBinarySearch.swift
//  Algorithm
//
//  Created by 문예지 on 6/6/25.
//
import Foundation

struct BinarySearchExistCheck {
    
    static func isExistTargetNumberBinary(_ target: Int, _ array: [Int]) -> Bool {
        var sortedNumbers = array.sorted(by: <)
        var minIndex = 0
        var maxIndex = sortedNumbers.count - 1
        var currentIndex = maxIndex/2
        
        while minIndex <= maxIndex {
            if (target == sortedNumbers[currentIndex]) {
                return true
            } else if (target < sortedNumbers[currentIndex]) {
                maxIndex = currentIndex - 1
            } else {
                minIndex = currentIndex + 1
            }
            currentIndex = (minIndex + maxIndex)/2
        }
        
        return false
    }
    
    static func test() {
        let findingTarget = 8
        let findingNumbers = [0, 3, 5, 6, 1, 2, 4]
        let result = isExistTargetNumberBinary(findingTarget, findingNumbers)
        print(result)
    }
}
