//
//  ArrayTest.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/18.
//

import Cocoa

class ArrayTest: NSObject {
    
    //找出数组中出现次数大于数组长度一般的元素
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
        var map = [Int:Int]()
        for ele in numbers {
            if (map.keys.contains(ele)) {
                map[ele]! += 1
                if map[ele]! > numbers.count {
                    return ele
                }
            } else {
                map[ele] = 1
            }
        }
        return -1
    }
    //找出数组中出现次数大于数组长度一般的元素
    //排序
    //n/2位置的元素就是最终的元素
    func method1(_ nums:[Int]) -> Int {
        nums.enumerated()
        var map = [Int:Int]()
        let tempNums = nums.sorted(by: { (n1:Int, n2:Int) -> Bool in
            return n1>n2
        })
        let middleIndex:Int = tempNums.count / 2
        return tempNums[middleIndex]
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var map = [Int:Int]()
        for (index,item) in nums.enumerated() {
            if (map.keys.contains(item)) {
                continue
            } else {
                map.updateValue(item, forKey: index)
            }
        }
        return map.values.count
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        var target = target
        for (index_first,first) in nums[0..<nums.count].enumerated() {
            target -= first
            for (index_second,second) in nums[0..<nums.count].enumerated() {
                if target == second {
                    res.append(index_first)
                    res.append(index_second)
                }
            }
            target += first
        }
        return res
    }
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for (index,ele) in nums.enumerated() {
            if map.values.contains(target - ele) {
                var res = [Int]()
                res.append(index)
                res.append(map[(target - ele)]!)
                return res
            } else {
                map.updateValue(index, forKey: ele)
            }
        }
        return []
    }
    
    
}
