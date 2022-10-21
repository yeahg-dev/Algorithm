    let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    var nodes: [Int: [Int]] = [:]

    for _ in 0..<input[1] {
      let nodeAndChild = readLine()!.split(separator: " ").map{Int(String($0))!}
        let node = nodeAndChild.first!
        let child = nodeAndChild.last!

        if var childs = nodes[node] {
          childs.append(child)
          childs.sort()
          nodes.updateValue(childs, forKey: node)
        } else {
          nodes.updateValue([child], forKey: node)
        }

        if var childs = nodes[child] {
          childs.append(node)
          childs.sort()
          nodes.updateValue(childs, forKey: child)
        } else {
          nodes.updateValue([node], forKey: child)
        }
    }
    
    let startNumber = input.last!

    func DFS(nodes: [Int: [Int]], startNumber: Int) -> String {
      var nodeToVisit: [Int] = []
      var visitedNodes: [Int] = []
      var path = ""

      nodeToVisit.append(startNumber)
      while !nodeToVisit.isEmpty {
          let node = nodeToVisit.removeLast()
          
          if visitedNodes.contains(node){
              continue
          }
          
          visitedNodes.append(node)
          path += "\(node) "
          nodeToVisit += (nodes[node] ?? []).sorted(by: >)
      }
        return path
    }

    func BFS(nodes: [Int: [Int]], startNumber: Int) -> String {
      var nodesToVisit: [Int] = []
      var visitedNodes: [Int] = []
      var path = ""
      
      nodesToVisit.append(startNumber)
      while !nodesToVisit.isEmpty {
          let node = nodesToVisit.removeFirst()
          
          if visitedNodes.contains(node) {
              continue
          }
          visitedNodes.append(node)
          path += "\(node) "
          nodesToVisit += nodes[node] ?? []
      }
        
      return path
    }

 print(DFS(nodes: nodes, startNumber: startNumber))
 print(BFS(nodes: nodes, startNumber: startNumber))
   
            
   