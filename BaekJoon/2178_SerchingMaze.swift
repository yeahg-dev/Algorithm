// 2178. 미로 탐색
// 요구 사항:  (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수
// 전략: 최소 경로 탐색이므로 너비 우선 탐색으로 경로 탐색
// 시간복잡도: O(V+E)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = input[0]
let width = input[1]

var maze: [[Int]] = []
// 방문 가능 여부를 1, 0으로 표시

for _ in 0..<height {
    var input = readLine()!.map{Int(String($0))!}
    maze.append(input)
}

var queue: [(y: Int, x: Int)] = [(0,0)]
var distance : [[Int]] = Array(repeating: Array(repeating: 0, count: width), count:height)

let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

distance[0][0] = 1

while !queue.isEmpty {
    let node = queue.removeFirst()
    let previousDistance = distance[node.y][node.x]
    
    for i in 0..<4 {
        let y = node.y + dy[i]
        let x = node.x + dx[i]
        
        if (0..<width).contains(x) && (0..<height).contains(y) && maze[y][x] == 1  {
            distance[y][x] = previousDistance + 1
            queue.append((y, x))
            maze[y][x] = 0
            
            if x == width - 1 && y == height - 1 {
                print(distance[height-1][width-1])
                break
            }
        }
    }
}
