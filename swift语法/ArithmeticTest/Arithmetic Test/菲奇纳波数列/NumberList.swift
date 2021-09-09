//
//  NumberList.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/23.
//

import Cocoa

class NumberList: NSObject {
    
    
    /**
     * 问题1:一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param number int整型
     * @return int整型
     */
    func jumpFloor ( _ number: Int) -> Int {
        // write code here
        if (number == 0)
        {
            return 0
        }
        else if (number == 1)
        {
            return 1
        }
        else if (number == 2)
        {
            return 2
        }
        else
        {
            return jumpFloor(number-1) + jumpFloor(number-2)
        }
        
    }
}
