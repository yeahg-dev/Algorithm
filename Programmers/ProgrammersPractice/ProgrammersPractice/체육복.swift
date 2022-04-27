//
//  체육복.swift
//  ProgrammersPractice
//
//  Created by 1 on 2022/04/27.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
  var students = [Int](repeating: 1, count: n+1)
    
    // 잃어버린 사람은 체육복 0벌
    for l in lost {
        students[l] -= 1
    }
    // 여벌 가져 온 사람은 +1 벌
    for r in reserve {
        students[r] += 1
    }
    
    // 일단 잃어버린 친구가 체육복을 빌릴 수 있는지 확인
    for (index, student) in students.enumerated() {
        if student == 0 {
            if index > 1, students[index-1] > 1 {
                students[index] += 1
                students[index-1] -= 1
                continue
            }
            if index < n, students[index+1] > 1 {
                students[index] += 1
                students[index+1] -= 1
                continue
            }
        }
    }
    
    return students.filter{$0 >= 1}.count - 1 // 체육 수업을 들을 수 있는 학생의 최대값
}
