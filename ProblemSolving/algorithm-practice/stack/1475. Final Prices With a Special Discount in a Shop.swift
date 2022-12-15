// Leetcode🤓  1475. Final Prices With a Special Discount in a Shop
// #monotonic stack

import Foundation

class Solution1475 {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var finalPrices: [Int] = []
        
        for (index, price) in prices.enumerated() {
            if index + 1 == prices.count {
                finalPrices.append(price)
                break
            }
            let nextindex = index + 1
            for next in prices[nextindex...] {
                if next <= price {
                    let final = price - next
                    finalPrices.append(final)
                    break
                } else if next == prices[prices.count - 1] {
                    finalPrices.append(price)
                    break
                } else {
                    continue
                }
            }
        }
        return finalPrices
    }
}


