//
//  main.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

typedef enum TestType {
    TestTypeLinkListInitOrTraverse     = 0, //链表初始化、正向遍历
    TestTypeReverseLinkList            = 1, //反转链表
    TestTypeMergeLinkList              = 2, //合并链表
    TestTypeDeleteSpecialNode          = 3, //删除指定的节点
    TestTypeSearchReverseIndexNode     = 4, //找出倒数第k个节点
    TestTypeIsExcixtCirle              = 5, //判断是否存在环
} TestType;


#import <Foundation/Foundation.h>
#import "GGZSinglyLInkList.h"
#import "GGZListNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        TestType type = TestTypeSearchReverseIndexNode;
        switch (type) {
            case TestTypeLinkListInitOrTraverse: {
                GGZSinglyLInkList *singleLinklist = [[GGZSinglyLInkList alloc] init];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@5 next:nil]];
                
                // 正常遍历
                NSLog(@"\n 正常遍历\n");
                [singleLinklist linkListIterator:^(id  _Nonnull data) {
                    NSLog(@"ele-> %@",data);
                }];
            }
                break;
            case TestTypeReverseLinkList: {
                GGZSinglyLInkList *singleLinklist = [[GGZSinglyLInkList alloc] init];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@5 next:nil]];
                
                NSLog(@"\n 逆向遍历\n");
                [singleLinklist reverseTraveseNodesNeededUseStack:NO];
                [singleLinklist linkListIterator:^(id  _Nonnull data) {
                    NSLog(@"ele-> %@",data);
                }];
            }
                break;
            case TestTypeMergeLinkList: {
                // 合并链表
                GGZSinglyLInkList *singleLinklist1 = [[GGZSinglyLInkList alloc] init];//5,1,4
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist1 addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                NSLog(@"\n链表1信息:\n");
                [singleLinklist1 linkListIterator:^(id  _Nonnull data) {
                    NSLog(@"\t %@ \t",data);
                }];
                
                GGZSinglyLInkList *singleLinklist2 = [[GGZSinglyLInkList alloc] init];//3,2,6
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist2 addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                NSLog(@"\n链表2信息:\n");
                [singleLinklist2 linkListIterator:^(id  _Nonnull data) {
                    NSLog(@"\t %@ \t",data);
                }];
                
                GGZListNode *mergeLinkListHead = [GGZSinglyLInkList mergeOrderLinkListWithFirst:singleLinklist1.head second:singleLinklist2.head];
                NSLog(@"\n合并链表后\n");
                [GGZSinglyLInkList printfLinkListWith:mergeLinkListHead block:^(id  _Nonnull data) {
                    NSLog(@"\t %@ \t",data);
                }];
            }
                break;
            case TestTypeDeleteSpecialNode: {
                GGZSinglyLInkList *singleLinklist = [[GGZSinglyLInkList alloc] init];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@5 next:nil]];
                
                //删除指定节点
                NSLog(@"\n 删除数据为2对应的节点\n");
                GGZListNode *neededRemove = [[GGZListNode alloc] initWithKey:nil data:@2 next:nil];
                [singleLinklist removeNode:neededRemove];
                [singleLinklist linkListIterator:^(id  _Nonnull data) {
                    NSLog(@"ele-> %@",data);
                }];
            }
                break;
            case TestTypeSearchReverseIndexNode: {
                GGZSinglyLInkList *singleLinklist = [[GGZSinglyLInkList alloc] init];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@1 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@2 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@3 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@4 next:nil]];
                [singleLinklist addListNode:[[GGZListNode alloc] initWithKey:nil data:@5 next:nil]];
                
                // 寻找链表随后第k个元素
                NSLog(@"\n 寻找链表倒数第k个元素\n");
                GGZListNode *node = [singleLinklist reverseSearchWithReverseOrderNumber:2];
                [GGZSinglyLInkList printfLinkListWith:node block:^(id  _Nonnull data) {
                    NSLog(@"\t %@ \t",data);
                }];
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
