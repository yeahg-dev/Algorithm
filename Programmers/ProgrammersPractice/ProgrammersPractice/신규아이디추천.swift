import Foundation

func solution(_ new_id:String) -> String {
    
    var newId: String = ""
    
    let lowerId = new_id.lowercased()
    
    for i in lowerId {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newId.append(i)
        }
    }
    
    // 😎 고차함수 버전
    // lowerId.filter{ $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." }.map{newId.append($0)}

    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }

    if newId.hasPrefix(".") {
        newId.removeFirst()
    }
    
    if newId.hasSuffix(".") {
        newId.removeLast()
    }
    
    if newId == "" {
        newId = "a"
    }
    
    if newId.count > 15 {
        let range = newId.index(newId.startIndex, offsetBy: 15) ..< newId.endIndex
        newId.removeSubrange(range)
        if newId.hasSuffix(".") {
            newId.removeLast()
        }
    }
    
    while newId.count < 3 {
        let last = newId.last!
        newId.append(last)
    }
    return newId
}

// 👻 오답 원인
// newId = newId.components(separatedBy: ["~","!","@","#","$","%","^","&","*","(",")","=","+","[","{","]","}",":","?","<",">","/"]).joined()
