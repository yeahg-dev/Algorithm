//
//  신고 결과 받기_2022Blind.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2023/04/05.
//

import Foundation
// 신고 -> 처리결과 메일로 발송
// 중복 신고 = 1회 신고
// k 이상 : 이용 정지, 신고한 모든 유저에게 메일 발송 (취합해서 한번에)

// 답: 유저별로 처리 결과 메일 받은 횟수 (즉 내가 신고한 아이디중 k회를 넘긴 아이디의 개수 )
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // [신고당한 유저: 신고당한 횟수]
    var reported_count = [String: Int]()
    // [신고자: [신고당한 유저]]
    var reporter_reported = [String: [String]]()
    
    for i in Set(report) {
        let arr = i.split(separator: " ").map{String($0)}
        reported_count[arr[1]] = (reported_count[arr[1]] ?? 0) + 1
        reporter_reported[arr[0]] = (reporter_reported[arr[0]] ?? []) + [arr[1]]
    }
    
    return id_list.map{ id in
        return (reporter_reported[id] ?? []).reduce(0) {
            $0 + ((reported_count[$1] ?? 0) >= k ? 1 : 0)
        }
    }
    
}
