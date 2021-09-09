//
//  main.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/15.
//

import Foundation


//数组查考
let obj1:ArrayTest = ArrayTest()
let arr:[Int] = [1,2,3,4,5,6,7,8,9,10]
//问题1：两数相加
//let res:[Int] = obj1.twoSum(arr, 10)
//let res:[Int] = obj1.twoSum1(arr, 10)
//for ele in res {
//    print("\n" + ele.description + "\n")
//}

//字符串考察
let stringObj:StringTest = StringTest()
let res:String = stringObj.searchRepetitionString("aaaabbbccd")
print(res)
