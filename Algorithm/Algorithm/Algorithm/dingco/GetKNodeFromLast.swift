//
//  GetKNodeFromLast.swift
//  Algorithm
//
//  Created by 문예지 on 6/6/25.
//

struct GetKthNodeFromLast {
    
    class Node {
        var data: Int
        var next: Node?
        
        init(_ data: Int) {
            self.data = data
            self.next = nil
        }
    }
    
    class LinkedList {
        var head: Node
        
        init(_ value: Int) {
            self.head = Node(value)
        }
        
        func append(_ value: Int) {
            var cur = head
            while cur.next != nil {
                cur = cur.next!
            }
            cur.next = Node(value)
        }
        
        func getKthNodeFromLast(_ k: Int) -> Node? {
            // nodeIndex = n - k
            // 총 몇개인지 알아야 끝에서 k번째를 알 수 있음
            var array: [Node?] = []
            var currentNode: Node? = head
            while currentNode?.next != nil {
                array.append(currentNode)
                currentNode = currentNode?.next
            }
            return array[array.count - k + 1]
        }
        
        func getKthNodeFromLast2(_ k: Int) -> Node? {
            // nodeIndex = n - k
            // 총 몇개인지 알아야 끝에서 k번째를 알 수 있음
            var slow: Node? = self.head
            var fast: Node? = self.head
            
            for _ in 0..<k {
                fast = fast?.next
            }
            while fast?.next != nil {
                slow = slow?.next
                fast = fast?.next
            }
            return slow
        }
    }
    
    static func test() {
        let linkedList = LinkedList(6)
        linkedList.append(7)
        linkedList.append(8)
        linkedList.append(9)
        
        if let result = linkedList.getKthNodeFromLast2(2) {
            print("정답 = 7 현재 풀이 값 =", result.data)
        } else {
            print("노드를 찾을 수 없습니다.")
        }
    }
}
