//
//  IcecreamParlor.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/10/04.
//

import Foundation

// 1️⃣ Brute Force
// O(n^2)

// 2️⃣ Hash Table
// O(n)
func findChoices(menus: [Int], budget: Int) -> [(Int, Int)] {
    var hashMapMenu = [Int: Int]()
    menus.enumerated().forEach { (index, menu) in
        hashMapMenu.updateValue(menu, forKey: index)
    }
    
    for (index, menu) in menus.enumerated() {
        let complement = budget - menu
        var candiateMenus = hashMapMenu
        candiateMenus.removeValue(forKey: index)
        // 만약 가격이 같은 메뉴가 2개라면?
        let complementIndex = candiateMenus[complement]
    }
    return [(Int, Int)]()
}

// 3️⃣ Sorting, BinarySearch
// O(nlongN)
// ✅ 검증 완료
class IcecreamParlorBinarySearch {
  
    static func findChoicesWithSorting(menus: [Int], budget: Int) -> [(Int, Int)] {
        let sortedMenus = menus.sorted()
        var chocies = [(Int, Int)]()
        
        for (index, menu) in sortedMenus.enumerated() {
            let complement = budget - menu
            guard let complementMenu = binarySearchPriceRecursive(
                    array: sortedMenus,
                    target: complement,
                    left: index + 1,
                    right: sortedMenus.count - 1 ) else {
                continue
            }
            
            if let indices = indicisFromValue(menus: menus, value1: menu, value2: complementMenu) {
                chocies.append(indices)
            }
        }
        return chocies
    }
    
    static func binarySearchPriceRecursive(
        array: [Int],
        target: Int,
        left: Int,
        right: Int)
    -> Int?
    {
        if left > right {
            return nil
        }
        let mid: Int = left + (right - left) / 2
        
        if array[mid] == target {
            return array[mid]
        } else if  target < array[mid] {
            return binarySearchPriceRecursive(
                array: array,
                target: target,
                left: left,
                right: mid - 1)
        } else {
            return binarySearchPriceRecursive(
                array: array,
                target: target,
                left: mid + 1,
                right: right)
        }
        
    }
    
    static func indicisFromValue(menus: [Int], value1: Int, value2: Int) -> (Int, Int)? {
        if let index1 = indexOf(menus: menus, value: value1, exculude: -1),
           let index2 = indexOf(menus: menus, value: value2, exculude: index1) {
            return (index1, index2)
        } else {
            return nil
        }
    }
    
    static func indexOf(menus: [Int], value: Int, exculude: Int) -> Int? {
        for (index, menu) in menus.enumerated() {
            if menu == value && index != exculude {
                return index
            }
        }
        return nil
    }
}
