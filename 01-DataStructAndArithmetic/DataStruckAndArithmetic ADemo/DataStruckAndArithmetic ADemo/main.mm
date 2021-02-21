//
//  main.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

typedef enum TestType {
    TestTypeLinkListTraverse = 0, //链表正向遍历、反转链表
    TestTypeMergeLinkList    = 1, //反转链表
    TestTypeIsExcixtCirle    = 2, //判断是否存在环
} TestType;


#import <Foundation/Foundation.h>
#import "GGZSinglyLInkList.h"
#import "GGZListNode.h"

typedef void(^MyBlock)(id data);

#pragma mark --
#pragma mark -- declaration
void printfLinkList(GGZListNode *head,MyBlock myblock);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        TestType type = TestTypeMergeLinkList;
        switch (type) {
            case TestTypeLinkListTraverse:
            {
                GGZSinglyLInkList *singleLinklist = [[GGZSinglyLInkList alloc] init];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@5 next:nil]];
                
                // 正常遍历
                NSLog(@"\n 正常遍历\n");
                NSMutableArray <GGZListNode *>*tranvseElements = [singleLinklist traverseNodes];
                [tranvseElements enumerateObjectsUsingBlock:^(GGZListNode *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSLog(@"ele-> %@",obj.data);
                }];
                
                // 逆向遍历
                NSLog(@"\n 逆向遍历\n");
                NSMutableArray <GGZListNode *>* reverseTranvseElements = [singleLinklist reverseTraveseNodesNeededUseStack:NO];
                [reverseTranvseElements enumerateObjectsUsingBlock:^(GGZListNode *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSLog(@"ele-> %@",obj.data);
                }];
                
                //寻找链表随后第k个元素
                NSLog(@"\n 寻找链表倒数第k个元素\n");
                GGZListNode *node = [singleLinklist reverseSearchWithReverseOrderNumber:2];
                printfLinkList(node, ^(id data) {
                    NSLog(@"\t %@ \t",data);
                });
            }
                break;
            case TestTypeMergeLinkList: {
                // 合并链表
                GGZSinglyLInkList *singleLinklist1 = [[GGZSinglyLInkList alloc] init];//5,1,4
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                NSLog(@"\n链表1信息:\n");
                printfLinkList(singleLinklist1.head, ^(id data) {
                    NSLog(@"\t %@ \t",data);
                });
            
                GGZSinglyLInkList *singleLinklist2 = [[GGZSinglyLInkList alloc] init];//3,2,6
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                NSLog(@"\n链表2信息:\n");
                printfLinkList(singleLinklist2.head, ^(id data) {
                    NSLog(@"\t %@ \t",data);
                });
                
                GGZListNode *mergeLinkListHead = [GGZSinglyLInkList mergeOrderLinkListWithFirst:singleLinklist1.head second:singleLinklist2.head];
                NSLog(@"\n合并链表后\n");
                printfLinkList(mergeLinkListHead, ^(id data) {
                    NSLog(@"\t %@ \t",data);
                });
            }
                break;
            case TestTypeIsExcixtCirle: {
                
            }
                break;
            default:
                break;
        }
    }
    return 0;
}

#pragma mark --
#pragma mark -- methods implementation
void printfLinkList(GGZListNode *head,MyBlock myblock) {
    while (head) {
        myblock(head.data);
        head = head.next;
    }
}
