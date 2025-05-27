//
//  FindPrimeListUnderNumber.swift
//  Algorithm
//
//  Created by 문예지 on 5/26/25.
//

import Foundation

struct FindPrimeListUnderNumber {
    
    static func findPrimeListUnderNumber(_ number: Int) -> [Int] {
        var result: [Int] = []
        for n in 2..<number {
            if isPrime(n, primeList: result) {
                result.append(n)
            }
        }
        return result
    }
    
    static func isPrime(_ number: Int, primeList: [Int]) -> Bool {
        for n in primeList {
            if number % n == 0 {
                return false
            }
        }
        return true
    }
    
    static func test() {
        let result = findPrimeListUnderNumber(20)
        print(result)
    }
}
