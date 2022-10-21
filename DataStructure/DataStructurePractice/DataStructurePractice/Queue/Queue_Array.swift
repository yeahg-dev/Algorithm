//
//  Queue.swift
//  DataStructurePractice
//
//  Created by Moon Yeji on 2022/10/02.
//

import Foundation

// enqueue: O(1)
// dequeue: O(N)

public struct Queue<T> {
    
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else { 
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
