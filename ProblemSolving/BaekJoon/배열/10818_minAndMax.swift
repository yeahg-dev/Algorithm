//
//  10818_minAndMax.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/10/05.
//

import Foundation

func solution10818() {
    let numberOfInteger = Int(readLine()!)!
    let integers = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    print(integers.min()!, integers.max()!)
}
