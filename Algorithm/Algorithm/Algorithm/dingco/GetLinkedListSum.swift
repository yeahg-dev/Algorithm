//
//  GetLinkedListSum.swift
//  Algorithm
//
//  Created by 문예지 on 6/1/25.
//

import Foundation

struct GetLinkedListSum {
    
    // MARK: 풀이1
    static func solution(_ linkedList1: LinkedList<Int>, _ linkedList2: LinkedList<Int>) -> Int {
        return makeNumber(linkedList1) + makeNumber(linkedList2)
    }
    
    static func makeNumber(_ linkedList: LinkedList<Int>) -> Int {
        var number: [Int?] = []
        var current = linkedList.head
        while current?.next != nil {
            number.append(current?.data)
            current = current?.next
        }
        number.append(current?.data)
        
        return Int(number.map{ $0 == nil ? "0" : String($0!)}.joined())!
    }
    
    // MARK: 풀이2
    static func solution2(_ linkedList1: LinkedList<Int>, _ linkedList2: LinkedList<Int>) -> Int {
        return getSingleLinkedListSum(linkedList1) + getSingleLinkedListSum(linkedList2)
    }
    
    static func getSingleLinkedListSum(_ linkedList: LinkedList<Int>) -> Int {
        var sum: Int = 0
        var current: Node<Int>? = linkedList.head
        while current?.next != nil {
            sum = sum * 10 + current!.data
            current = current?.next
        }
        sum = sum * 10 + current!.data
        return sum
    }
    
    
    static func test() {
        let linkedList1 = LinkedList(6)
        linkedList1.append(7)
        linkedList1.append(8)
        let linkedList2 = LinkedList(3)
        linkedList2.append(5)
        linkedList2.append(4)
        
        print("답: \(solution2(linkedList1, linkedList2))")
    }
}
