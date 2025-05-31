//
//  main.swift
//  Algorithm
//
//  Created by 문예지 on 5/22/25.
//

import Foundation

class Runner {
    
    static func run(_ task: () -> Void) {
        task()
    }
    
}

Runner.run {
    var linkedList = LinkedList<Int>(5)
    linkedList.append(12)
    linkedList.append(8)
    linkedList.printAll()
    print("-------")
    linkedList.add(7, to: 1)
    linkedList.printAll()
    print("-------")
    linkedList.removeNode(at: 2)
    linkedList.printAll()
    print("-------") 
    linkedList.removeNode(at: 0)
    linkedList.printAll()
}
