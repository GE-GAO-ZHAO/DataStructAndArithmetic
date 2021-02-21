//
//  GGZLInkList.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

#import "GGZSinglyLInkList.h"
#import "GGZStack.h"
@implementation GGZSinglyLInkList

/// 添加元素-单个元素
- (BOOL)addListNode:(GGZListNode *)listNode {
    //第一种方式：头插法
    if (self.head) {
        listNode.next = self.head;
        self.head = listNode;
    } else {
        self.head = listNode;
    }
    
    //第二种方式：尾插法
    
    
    //第三种方式：
    
    return YES;
}

/// 添加元素-组元素
- (void)addListNodes:(NSArray <GGZListNode *> *)listNodes {
    NSAssert((listNodes == nil || listNodes.count <= 0), @"LInkList is not nill or element count is not than zero");
    [listNodes enumerateObjectsUsingBlock:^(GGZListNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addListNode:obj];
    }];
}

/// 遍历元素
- (NSMutableArray <GGZListNode *>*)traverseNodes {
    NSMutableArray <GGZListNode *>*array = [[NSMutableArray alloc] init];
    GGZListNode *nextNode = self.head;
    while (nextNode) {
        [array addObject:nextNode];
        nextNode = nextNode.next;
    }
    return array;
}

/// 删除元素
- (void)removeNode:(GGZListNode *)node {
    if ([node.data integerValue] == [self.head.data integerValue]) {
        self.head = self.head.next;
    } else {
        GGZListNode *fastPtr = self.head;
        GGZListNode *slow    = self.head;
        while (fastPtr) {
            if ([fastPtr.data integerValue] == [node.data integerValue]) {
                slow.next = fastPtr.next;
                fastPtr = nil;
                fastPtr = slow.next;
            } else {
                slow = fastPtr; //慢指针已到快指针的位置
                fastPtr = fastPtr.next;//快指针向后移动一步
            }
        }
        NSLog(@"");
    }
}

/// 插入元素
- (void)insertNode:(GGZListNode *)node {
    NSAssert(node == nil, @"node is not nill");
}

/// 逆向遍历 || 反转链表
/// 方式1: 使用栈FILO
/// 方式2: 3指针方法
- (NSMutableArray <GGZListNode *>*)reverseTraveseNodesNeededUseStack:(BOOL)neededUseStack {
    NSMutableArray <GGZListNode *>*array = [[NSMutableArray alloc] init];
#ifdef neededUseStack /*使用栈FILO*/
    GGZStack *stack = [self lintListNodePushStackWith:self.head];
    array =  stack ? [stack traveseElement] : @[];
#else /*3指针方法*/
    GGZListNode *prevNode = nil;              /*构造一个空的前一个节点指针*/
    GGZListNode *curNode  = self.head;
    while (curNode != nil) {
        GGZListNode *nextNode = curNode.next; /*将下一个节点临时保存*/
        curNode.next          = prevNode;     /*将当前指针数据域指向前一个节点*/
        prevNode              = curNode;      /*前一个指针移动到当前指针*/
        curNode               = nextNode;     /*当前指针移动到下一个指针*/
    }
    self.head = prevNode;
    array = [self traverseNodes];
#endif
    return array;
}

- (GGZListNode *)reverseSearchWithReverseOrderNumber:(NSInteger)reverseOrderNumber {
    __block GGZListNode *node = nil;
    //第一种方式：转化为数组，然后从数组中去删除
    //时间复杂度 O(2n)，遍历两边
    //    NSMutableArray <GGZListNode *>*arr = [self traverseNodes];
    //    NSInteger needDeleteIndex = (arr.count - reverseOrderNumber) - 1;
    //    [arr enumerateObjectsUsingBlock:^(GGZListNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        if (obj && needDeleteIndex == idx) node = obj;
    //    }];
    
    //第二种方式：压栈，取出栈的第 元素个数-reverseOrderNumber 对应的元素即可
    //    GGZStack *stack = [self lintListNodePushStackWith:self.head];
    //    NSInteger needIndex = (arr.count - reverseOrderNumber) - 1;
    //    node = [stack traveseElementWithIndex:needIndex];
    //
    //第三种方式：快慢指针法
    GGZListNode *slowPtr = self.head;
    GGZListNode *fastPtr = self.head;
    //3.1先正向将快指针移动 reverseOrderNumber 个元素
    for (int i=0; i < reverseOrderNumber; ++i) {
        fastPtr = fastPtr.next;
    }
    //3.2慢指针、快指针同步移动，知道快指针为空时，对应满指针对应的节点就是我们要找到倒数第reverseOrderNumber个节点
    while (fastPtr != nil) {
        fastPtr = fastPtr.next;
        slowPtr = slowPtr.next;
    }
    node = slowPtr;
    /**
     eg: 1 2 3 4 5
     第一步：fastPtr先指向元素为3的数子
     第二步：如下
     数字
     fastPtr        3        4      5     null
     slowPtr       1        2      3       4
     */
    
    return node;
}

+ (GGZListNode *)mergeOrderLinkListWithFirst:(GGZListNode *)firstHead second:(GGZListNode *)secondHead; {
    //    //思路1：递归法，两个链表头部值较小的一个节点与剩下元素的 merge 操作结果合并，只可意会
    //    if (!firstHead)  return secondHead;
    //    if (!secondHead) return firstHead;
    //    if ([firstHead.data integerValue] < [secondHead.data integerValue]) {
    //        firstHead.next  = [self mergeOrderLinkListWithFirst:firstHead.next second:secondHead];
    //        return firstHead;
    //    } else {
    //        secondHead.next = [self mergeOrderLinkListWithFirst:firstHead second:secondHead.next];
    //        return secondHead;
    //    }
    
    //思路2: 非递归，新建一个空的链表，将其他两个链表合并的元素一一落入这个链表，只可意会
    GGZListNode *tempHead    = [[GGZListNode alloc] init]; //新的链表
    GGZListNode *currentPtr = tempHead;
    while (firstHead != nil && secondHead != nil) {
        if ([firstHead.data integerValue] < [secondHead.data integerValue]) {
            currentPtr.next = firstHead;        //将最小的节点落入新的链表
            currentPtr      = currentPtr.next;  //新链表当前指针向后移动一位
            firstHead       = firstHead.next;   //第一个链表头部指针后移动一位
        } else {
            currentPtr.next = secondHead;       //将最小的节点落入新的链表
            currentPtr      = currentPtr.next;  //新链表当前指针向后移动一位
            secondHead      = secondHead.next;  //第二个链表头部指针后移动一位
        }
    }
    //任意一个链表为空，将另一个不为空的链表放入新链表中
    if (!firstHead) {
        currentPtr.next = secondHead;
    } else {
        currentPtr.next = firstHead;
    }
    return tempHead.next;
}

#pragma mark -- PRIVATE METHODS
- (NSInteger)count {
    NSInteger count = 0;
    GGZListNode *nextNode = self.head;
    while (nextNode) {
        count++;
        nextNode = nextNode.next;
    }
    return count;
}

- (GGZStack *)lintListNodePushStackWith:(GGZListNode *)head {
    if (!head) nil;
    GGZStack *stack = [[GGZStack alloc] initWithSize:[self count]];
    GGZListNode *nextNode = head;
    while (nextNode) {
        [stack push:nextNode];
        nextNode = nextNode.next;
    }
    return stack;
}

@end

@implementation GGZSinglyLInkList (Iterator)
+ (void)printfLinkListWith:(GGZListNode *)head block:(Block)myblockl {
    GGZListNode *curPtr = head;
    while (curPtr) {
        myblockl(curPtr.data);
        curPtr = curPtr.next;
    }
}

- (void)linkListIterator:(Block)myblock {
    GGZListNode *curPtr = self.head;
    while (curPtr) {
        myblock(curPtr.data);
        curPtr = curPtr.next;
    }
}
@end
