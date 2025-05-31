//
//  LinkedList.swift
//  Algorithm
//
//  Created by 문예지 on 5/31/25.
//

import Foundation

final class Node: CustomStringConvertible {
    
    var data: Any
    var next: Node? = nil
    
    var description: String {
        return String(describing: data)
    }
    
    init(data: Any) {
        self.data = data
    }
    
}

final class LinkedList<T> {
    
    var head: Node?
    
    init(_ head: T) {
        self.head = Node(data: head)
    }
    
    func append(_ data: T) {
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(data: data)
    }
    
    func printAll() {
        var current = head
        while current?.next != nil {
            print(current?.data as Any)
            current = current?.next
        }
        print(current)
    }
    
    func getNode(_ index: Int) -> Node? {
        var current = head
        var currentIndex = 0
        
        while currentIndex != index {
            current = current?.next
            currentIndex += 1
        }
        
        return current
    }
    
    func add(_ nodeData: Any, to index: Int) {
        guard index != 0 else {
            let newNode = Node(data: nodeData)
            newNode.next = self.head
            self.head = newNode
            return
        }
        
        guard let previousNode = getNode(index-1) else { return }
        
        let nextNode = previousNode.next
        
        let newNode = Node(data: nodeData)
        previousNode.next = newNode
        newNode.next = nextNode
    }
    
    func removeNode(at index: Int) {
        guard index != 0 else {
            self.head = self.head?.next
            return
        }
        
        let previousNode = getNode(index - 1)
        let node = previousNode?.next
        let nextNode = node?.next
        
        previousNode?.next = nextNode
    }
}
