//
//  Stack_Node.swift
//  DataStructurePractice
//
//  Created by Moon Yeji on 2022/10/02.
//

import Foundation

struct Stack_Node<T> {
    
    private class Node<T> {
        
        var data: T
        var next: Node<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var top: Node<T>?
    
    var isEmpty: Bool {
        return top == nil
    }
    
    mutating func push(_ data: T) {
        let newNode = Node(data: data)
        if top != nil {
            newNode.next = top
        }
        top = newNode
    }
    
    mutating func pop() -> T? {
        let data = top?.data
        top = top?.next
        return data
    }
}
