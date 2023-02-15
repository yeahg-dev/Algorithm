//
//  PathSum.swift
//  algorithm-practice
//
//  Created by Moon Yeji on 2022/10/04.
//
// LeetCode 11.PathSum
// https://leetcode.com/problems/path-sum/
// 재귀적으로 leafNode를 발견할 때까지 더해감
// root-leafNode의 합을 targetSum과 비교
// BinaryTree, DFS, Recursion
// 시간복잡도: O(N)

import Foundation

 //  Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class PathSum {
   
     func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.val == targetSum && root.left == nil && root.right == nil { return true }
        
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

