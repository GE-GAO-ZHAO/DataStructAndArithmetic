//
//  StringTest.swift
//  Arithmetic Test
//
//  Created by 葛高召 on 2021/8/20.
//

import Cocoa

class StringTest: NSObject {
    //题目：aabbc 输出 2a2b1c
    func searchRepetitionString(_ input:NSString) -> String {
        let charString:[Character] = StringTest.stringToArray(input)
        var res:String = ""
         
        var index:Int = 0
        for ele in charString[index..<charString.count] {
            var repeat_count:Int = 1
            let begin_temp:Int = index+1
            for temp in charString[begin_temp..<charString.count] {
                if temp == ele {
                    repeat_count = repeat_count + 1
                } else {
                    break
                }
            }
            index += begin_temp
            res += repeat_count.description + ele.description
        }
        return res
    }
    
    class func stringToArray(_ input:NSString) ->[Character] {
        let arrInput = (0..<input.length).map({
            Character(UnicodeScalar(input.character(at: $0))!)
            
        })
        return arrInput
    }
    
    
    
    //问题：替换字符串中的空格
    func releaseWhiteSpace() -> Void {
        let str:String = "aa aass scccc"
        var aa = String()
        for ele in str {
            if ele == " " {
                aa += "%20"
            } else {
                aa += ele.description
            }
        }
        print(aa)
    }
}
