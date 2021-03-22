//
//  GGZSimpleBinaryTree.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import "GGZSimpleBinaryTree.h"
#import "NSStack.h"
#import "NSQueue.h"

@interface GGZSimpleBinaryTree()

#pragma mark --
@property (nonatomic,strong) NSMutableArray <NSNumber*> *path;/*维护一条路径*/
@property (nonatomic,strong) NSMutableArray <NSMutableArray *> *paths;/*维护多条路径*/

@end

@implementation GGZSimpleBinaryTree

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.path = [[NSMutableArray alloc] init];
        self.paths = [[NSMutableArray alloc] init];
    }
    return self;
}

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

- (void)inserTreeNodeWithCurNode:(GGZSimpleBinaryNode * _Nullable)curNode
                            left:(GGZSimpleBinaryNode * _Nullable)left
                           right:(GGZSimpleBinaryNode * _Nullable)right {
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
    NSStack *stack = [[NSStack alloc] initWithSize:20];
    GGZSimpleBinaryNode *movePtr = node;
    while (stack.top || nil != movePtr) {
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
    NSQueue *queue = [[NSQueue alloc] initWithCapacity:20];
    [queue push:node];
    while (![queue isEmpty]) {
        GGZSimpleBinaryNode *tempNode = [queue pop];
        NSLog(@"%@",tempNode.data);
        if (nil != tempNode.left) {
            [queue push:tempNode.left];
        }
        if (nil != tempNode.right) {
            [queue push:tempNode.right];
        }
    }
}

#pragma mark --
#pragma mark -- 二分查找
/*
              8
      3              10
  1       6                12
        4   7
 */
- (BOOL)isExciteSpecialWithNode:(GGZSimpleBinaryNode *)node root:(GGZSimpleBinaryNode *)root {
    GGZSimpleBinaryNode *movePtr = node;
    BOOL isExcite = NO;
    while (nil != movePtr) {
        if ([movePtr.data integerValue] > [[node data] integerValue]) {
            movePtr = movePtr.left;
        } else if ([movePtr.data integerValue] < [[node data] integerValue]) {
            movePtr = movePtr.right;
        } else {
            isExcite = YES;
            break;;
        }
    }
    return isExcite;
}

/// @brief 是否是平衡二叉树
- (BOOL)isBalanceTree:(GGZSimpleBinaryNode *)node {
    BOOL isBalanceTree = NO;
    
    
    return isBalanceTree;
}

/// @brief 获取二叉树和为某一个目标值的所有路径
- (NSMutableArray <NSMutableArray *> *)hasPathWithRoot:(GGZSimpleBinaryNode *)root sum:(NSInteger)sum {
    [self getResHasPathWithRoot:root target:sum];
    return self.paths;
}

/// @Des  主要考察1.把tartget分解 2.切记只有最后一个节点没有子叶子树才是合法的一条路径
- (void)getResHasPathWithRoot:(GGZSimpleBinaryNode *)root target:(NSInteger)target {
    if (nil != root) {
        [self.path addObject:root.data];
        if ([root.data integerValue] == target && nil == root.left && nil == root.right) {/*合法路径*/
            [self.paths addObject:[NSMutableArray arrayWithArray:self.path]];
        }
        if ([root.data integerValue] <= target && nil != root.left) {
            [self getResHasPathWithRoot:root.left target:(target - [root.data integerValue])];
        }
        if ([root.data integerValue] <= target && nil != root.right) {
            [self getResHasPathWithRoot:root.right target:(target - [root.data integerValue])];
        }
        [self.path removeLastObject];
    }
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
