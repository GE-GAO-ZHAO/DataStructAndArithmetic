//
//  main.m
//  DataStructAndArithmetic
//
//  Created by gegaozhao on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import "TestMutiableThread.h"

#import "CommonAlgorithm.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        TestMutiableThread * obj = [[TestMutiableThread alloc] init];
        [obj test];

    }
    return 0;
}



/// 数组
void testArray() {
    // -数组：
    // 概念：保存多个各种类型元素的有素集合，以下标标记存储单元和以下标查找指定的元素
    //
    // 特点：
    // 有序、可以重复
    //
    // 优点：
    // 插入快
    //
    // 缺点：
    // 查找满
    NSObject *obj = [[NSObject alloc] init];
    NSArray <NSNumber *> *arr1 = @[obj,obj];
}

/// 链表
void testLinkedList() {
    // -链表：
    // 官方概念：
    // 
    
}
