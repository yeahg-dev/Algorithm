import Foundation

// Leetcode🐣 1021. Remove Outermost Parentheses
// 가장 바깥의 괄호쌍을 제거하는 문제
// 일단 "("를 만나면, 제거하고 이에 대응하는 나머지 쌍인 ")"를 제거하면 됨.
// 그 사이에 친구는 리턴시킨다.
// ☑️ 다른 풀이 참고함

class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var finalstr = ""
        var counter = 0
        for str in s {
            if str == "(" {
               if counter > 0 {
                  finalstr.append(str)
               }
               counter += 1
            } else if str == ")" {
               counter -= 1
               if counter > 0 {
                   finalstr.append(str)
               }
            }
        }
        return finalstr
    }
}
