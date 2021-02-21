//
//  GGZLInkList.h
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

#import <Foundation/Foundation.h>
#import "GGZListNode.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^Block)(id data);

@interface GGZSinglyLInkList : NSObject

@property (nonatomic,strong) GGZListNode *head;

/// @brief 添加元素-单个元素
- (BOOL)addListNode:(GGZListNode *)listNode;

/// @brief 添加元素-组元素
- (void)addListNodes:(NSArray <GGZListNode *> *)listNodes;

/// @brief 遍历元素
- (NSMutableArray <GGZListNode *>*)traverseNodes;

/// @brief 删除元素
- (void)removeNode:(GGZListNode *)node;

/// @brief 插入元素
- (void)insertNode:(GGZListNode *)node;

/// @brief 逆向遍历
/// @param neededUseStack 是否使用栈辅助
- (NSMutableArray <GGZListNode *>*)reverseTraveseNodesNeededUseStack:(BOOL)neededUseStack;

/// @brief 寻找链表随后第k个元素
- (GGZListNode *)reverseSearchWithReverseOrderNumber:(NSInteger)reverseOrderNumber;

/// @brief 合并两个有序链表,返回最终的链表的首节点
+ (GGZListNode *)mergeOrderLinkListWithFirst:(GGZListNode *)firstHead second:(GGZListNode *)secondHead;


@end


@interface GGZSinglyLInkList (Iterator)
+ (void)printfLinkListWith:(GGZListNode *)head block:(Block)myblockl;
- (void)linkListIterator:(Block)myblock;

@end


NS_ASSUME_NONNULL_END
