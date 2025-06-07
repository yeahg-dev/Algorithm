//
//  IsAvailableToOrder.swift
//  Algorithm
//
//  Created by 문예지 on 6/7/25.
//

struct IsAvailableToOrder {
    
    static func isAvailableToOrder(menus: [String], orders: [String]) -> Bool {
        let  menuSet = Set(menus)
        for order in orders {
            if !menuSet.contains(order)  // O(1)
            {
                return false
            }
        }
        return true
    }
    
    static func test() {
        let shopMenus = ["만두", "떡볶이", "오뎅", "사이다", "콜라"]
        let shopOrders = ["오뎅", "콜라", "만두"]
        
        let result = isAvailableToOrder(menus: shopMenus, orders: shopOrders)
        print("정답 = true 현재 풀이 값 =", result)
    }
}
