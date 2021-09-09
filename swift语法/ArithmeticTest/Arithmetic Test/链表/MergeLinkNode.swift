//
//  MergeLinkNode.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/15.
//

import Cocoa


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}


public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pHead1 ListNode类
     * @param pHead2 ListNode类
     * @return ListNode类
     */
    func Merge ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        if pHead1 == nil {
            return pHead2
        } else if (pHead2 == nil) {
            return pHead1
        } else {
            if let val1 = pHead1?.val,
               let val2 = pHead2?.val,
               val1 <= val2 {
                pHead1?.next = mergeTwoLists(pHead1?.next,pHead2)
                return pHead1
            } else {
                pHead2?.next = mergeTwoLists(pHead1,pHead2?.next)
                return pHead2
            }
        }
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if (l2 == nil) {
            return l1
        } else {
            if let val1 = l1?.val,
               let val2 = l2?.val,
               val1 <= val2 {
                l1?.next = mergeTwoLists(l1?.next,l2)
                return l1
            } else {
                l2?.next = mergeTwoLists(l1,l2?.next)
                return l2
            }
        }
    }
}

class MergeLinkNode: NSObject {
    
}
