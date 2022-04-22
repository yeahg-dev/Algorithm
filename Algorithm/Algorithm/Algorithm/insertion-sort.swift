//
//  main.swift
//  Algorithm
//
//  Created by 1 on 2022/04/22.
//

import Foundation

// 1️⃣
func insertionSort1(_ array: [Int]) -> [Int] {
  var sortedArray = array
  for index in 1..<sortedArray.count {
    var currentIndex = index
    let temp = sortedArray[currentIndex]
      // temp가 들어갈 index를 조회
    while currentIndex > 0 && temp < sortedArray[currentIndex - 1] {
      // currentIndex의 값이 currentIndex-1보다 작으면 currentIndex에 해당 값을 할당
      sortedArray[currentIndex] = sortedArray[currentIndex - 1]
      currentIndex -= 1
    }
    // 적절한 위치의 index에 temp 할당
    sortedArray[currentIndex] = temp
  }
  return sortedArray
}

// 2️⃣ Swap을 이용한 방식
func insertionSort(_ array: [Int]) -> [Int] {
    var sortedArray = array             // 1
    for index in 1..<sortedArray.count {         // 2
        var currentIndex = index
        while currentIndex > 0 && sortedArray[currentIndex] < sortedArray[currentIndex - 1] { // 3
            sortedArray.swapAt(currentIndex - 1, currentIndex)
            currentIndex -= 1
        }
    }
    return sortedArray
}
