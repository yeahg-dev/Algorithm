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
    GetLinkedListSum.test()
}
