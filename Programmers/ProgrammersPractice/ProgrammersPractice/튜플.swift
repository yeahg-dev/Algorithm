//
//  튜플.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/05/18.
//

import Foundation

func tuple(_ s:String) -> [Int] {
    var elements = s
      // Int 2차원 배열로 변환 > 집합으로 타입 변환
      // 양끝 괄호 제거
      elements.removeLast()
      elements.removeFirst()
      // 순회 돌면서 집합으로 만들기
      var sets: Array<Set<Int>> = []
      var set: Set<Int> = []
      var num = ""
      for element in elements {
           if element == "," {
               if num != "" {
                   let completeNum = Int(num)!
                   set.insert(completeNum)
                   num = ""
               }
          } else if element == "}" {
              let completNum = Int(num)!
              set.insert(completNum)
              num = ""
              sets.append(set)
              set = []
          } else {
              if element.isNumber {
                 num += String(element)
              }
          }
      }
      // 크기순으로 나열
      sets.sort{ $0.count < $1.count}
      // 여집합 +  첫번째 원소
      var tuple: [Int] = []
      let first = sets[0].first
      tuple.append(first!)
      
      for (index, value) in sets.enumerated() {
          if index == sets.count - 1 {
              continue
          }
          let firstSet = sets[index]
          let secondSet = sets[index+1]
          let number = firstSet.symmetricDifference(secondSet).first
          tuple.append(number!)
      }
      return tuple
}


