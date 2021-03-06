import Foundation

// Leetcode๐ฃ 1021. Remove Outermost Parentheses
// ๊ฐ์ฅ ๋ฐ๊นฅ์ ๊ดํธ์์ ์ ๊ฑฐํ๋ ๋ฌธ์ 
// ์ผ๋จ "("๋ฅผ ๋ง๋๋ฉด, ์ ๊ฑฐํ๊ณ  ์ด์ ๋์ํ๋ ๋๋จธ์ง ์์ธ ")"๋ฅผ ์ ๊ฑฐํ๋ฉด ๋จ.
// ๊ทธ ์ฌ์ด์ ์น๊ตฌ๋ ๋ฆฌํด์ํจ๋ค.
// โ๏ธ ๋ค๋ฅธ ํ์ด ์ฐธ๊ณ ํจ

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
