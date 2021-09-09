//
//  BuildBaniryTree.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/15.
//

import Cocoa


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

/*
 题目：根据前序、中序 构建二叉树
 没有使用map保存中序遍历index关系，可以降低一定的内存
 */
public class Solution1 {
    var value_index_mapping = [Int:Int]()
    func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
        return buildTree(pre, vin, 0, pre.count-1,  0, vin.count-1)
    }
    
    func buildTree(_ pre: [Int],  _ vin: [Int],_ pre_left:Int,_ pre_right:Int,_ in_left:Int,_ in_right:Int) ->TreeNode? {
        if pre_left > pre_right || in_left > in_right {
            return nil
        }
        
        let val:Int? = pre[pre_left]
        let root:TreeNode = TreeNode.init(val!,nil,nil)
        let index_inVin:Int? = vin.firstIndex(of: val!)
        //获取到左子树集合的个数
        let left_childs:Int? = index_inVin! - in_left
        // 递归地构造左子树，并连接到根节点
        // 先序遍历中「从 左边界+1 开始的 left_childs」个元素就对应了中序遍历中「从 左边界 开始到 根节点定位-1」的元素
        root.left = buildTree(pre, vin, pre_left + 1, pre_left + left_childs!, in_left, index_inVin! - 1)
        // 递归地构造右子树，并连接到根节点
        // 先序遍历中「从 左边界+1+左子树节点数目 开始到 右边界」的元素就对应了中序遍历中「从 根节点定位+1 到 右边界」的元素
        root.right = buildTree(pre, vin, pre_left + left_childs! + 1, pre_right, index_inVin! + 1, in_right)
        return root
    }
}

/*
 题目：按层级去遍历二叉树
 */
public class Solution2 {
    
}

class BuildBaniryTree: NSObject {
    
}




