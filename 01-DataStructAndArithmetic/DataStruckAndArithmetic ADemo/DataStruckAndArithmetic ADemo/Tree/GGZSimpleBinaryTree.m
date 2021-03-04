//
//  GGZSimpleBinaryTree.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import "GGZSimpleBinaryTree.h"
#import "GGZStack.h"
@implementation GGZSimpleBinaryTree

- (instancetype)initTreeWith:(NSArray <id>*)nodes size:(NSInteger)size {
//    for (int i; i < size; ++i) {
//        GGZSimpleBinaryNode *node = nodes[i];
//        if (!self.root) {
//            self.root = node;
//        } else {
//
//        }
//    }
    return nil;
}

- (void)inserTreeNodeWithCurNode:(GGZSimpleBinaryNode *)curNode left:(GGZSimpleBinaryNode *)left right:(GGZSimpleBinaryNode *)right {
    curNode.left = left;
    curNode.right = right;
}

#pragma mark --
#pragma mark -- 递归遍历相关
/// @brief 前序
- (void)previousOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node {
    if (!node) return;
    NSLog(@"%@ \t",node.data);
    [self previousOrderTraverseWithRootNode:node.left];
    [self previousOrderTraverseWithRootNode:node.right];
}

/// @brief 中序
- (void)middleOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node {
    [self previousOrderTraverseWithRootNode:node.left];
    NSLog(@"%@ \t",node.data);
    [self previousOrderTraverseWithRootNode:node.right];
}

/// @brief 后序
- (void)postOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node {
    [self previousOrderTraverseWithRootNode:node.left];
    [self previousOrderTraverseWithRootNode:node.right];
    NSLog(@"%@ \t",node.data);
}

#pragma mark --
#pragma mark -- 非递归
- (void)middleOrderTraverseByStackWithRootNode:(GGZSimpleBinaryNode *)node {
    if (!node) return;
    GGZStack *stack = [[GGZStack alloc] initWithSize:20];
    GGZSimpleBinaryNode *movePtr = node;
    while (stack.top || nil != movePtr ) {
        //找最左边，一条道走到底，走到movePtr为空代表最左侧节点走到底啦
        while (nil != movePtr) {
            [stack push:movePtr];
            movePtr = movePtr.left;
        }
        
        //movePtr为空，需要找右边的元素
        if (stack.top) {
            movePtr = [stack pop]; //拿到movePtr的父节点
            NSLog(@"%@\t",movePtr.data);
            movePtr = movePtr.right;
        }
    }
}

#pragma mark --
#pragma mark -- 按层级遍历
- (void)hierarchyTraverseWithRootNode:(GGZSimpleBinaryNode *)node {
    
}

@end


@implementation GGZSimpleBinaryNode

- (instancetype)initWithData:(id)data {
    self = [super init];
    if (self) {
        self.left = nil;
        self.right = nil;
        self.data = data;
    }
    return self;
}
@end
