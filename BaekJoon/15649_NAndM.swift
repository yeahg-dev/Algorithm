// 15649. N과 M(1)
//
// Q. 요구사항
// 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.
//  - 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
//
// 전략: 모든 경우의 수를 탐색, 조건을 변경해가며 반복문을 수행해야하기 때문에 백트래킹 활용
// 시간복잡도: O(N^2)

func backtracking() {
  let input = readLine()!.split(separator: " ").map{Int(String($0))!}
  var n = input[0]
  var m = input[1]

  var result: [Int] = []
  var hasVisited: [Bool] = [Bool](repeating: false, count: n+1)

  pickNumber(trial: 0)
  
  func pickNumber(trial: Int) {
    if trial == m {
      print(result.map{String($0)}.joined(separator: " "))
      return 
    }

    for i in 1..<n+1 {
      if hasVisited[i] == false {
        result.append(i)
        hasVisited[i] = true
        pickNumber(trial: trial + 1)
        result.removeLast()
        hasVisited[i] = false
      }
    }
  }

}

backtracking()
