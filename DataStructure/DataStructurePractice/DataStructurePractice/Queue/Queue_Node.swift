//
//  Queue_head_tail.swift
//  DataStructurePractice
//
//  Created by Moon Yeji on 2022/10/02.
//

import Foundation

// LinkedList와 같은 방식
// enqueue: O(1)
// dequeue: O(1)

struct Queue_Node<T> {

    private class Node<T> {
        
        var data: T
        var next: Node<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.data
    }
    
    // O(1)
    mutating func enqueue(data: T) {
        let newNode = Node(data: data)
        if tail != nil {
            tail?.next = newNode
        }
        tail = newNode
        
        if head == nil {
            head = newNode
        }
    }
    
    // O(1)
    mutating func dequeue() -> T? {
        guard let currentHead = head else {
            return nil
        }
        
        let data = currentHead.data
        head = currentHead.next
        return data
    }
    
}
