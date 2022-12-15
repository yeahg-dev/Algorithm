//
//  핸드폰번호가리기.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/12/15.
//

import Foundation

func shieldPhoneNumber(phone_number: String) -> String {
    let count = phone_number.count - 4
    if count == 0 {
        return phone_number
    }
    var result = ""
    for _ in 0..<count {
        result += "*"
    }
    let index = phone_number.index(phone_number.endIndex, offsetBy: -4)
    let number = phone_number[index..<phone_number.endIndex]
    result += number
    return result
}
