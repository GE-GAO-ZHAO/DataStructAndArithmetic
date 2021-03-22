//
//  GGZSimpleBinaryTree.h
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GGZSimpleBinaryNode : NSObject
@property (nonatomic,strong) GGZSimpleBinaryNode *left;
@property (nonatomic,strong) GGZSimpleBinaryNode *right;
@property (nonatomic,strong) id                   data;

- (instancetype)initWithData:(id)data;
@end

@interface GGZSimpleBinaryTree<__covariant ObjectType> : NSObject
@property (nonatomic,strong) GGZSimpleBinaryNode *root;

- (instancetype)initTreeWith:(NSArray <ObjectType>*)nodes size:(NSInteger)size;
- (void)inserTreeNodeWithCurNode:(GGZSimpleBinaryNode * _Nullable)curNode
                            left:(GGZSimpleBinaryNode * _Nullable)left
                           right:(GGZSimpleBinaryNode * _Nullable)right;

/// @brief 递归：中序、前序、后续
- (void)previousOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)middleOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)postOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;

/// @brief 非递归中序
- (void)middleOrderTraverseByStackWithRootNode:(GGZSimpleBinaryNode *)node;

/// @brief 按层级打印
- (void)hierarchyTraverseWithRootNode:(GGZSimpleBinaryNode *)node;

/// @brief 二叉查找法判断某一个元素是否存在
- (BOOL)isExciteSpecialWithNode:(GGZSimpleBinaryNode *)node root:(GGZSimpleBinaryNode *)root;
  
/// @brief 是否是平衡二叉树
- (BOOL)isBalanceTree:(GGZSimpleBinaryNode *)node;

/// @brief 字节面试：输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径
/// @link     leetcode原题：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
/// @return 返回所有和为sum的路径信息，可能汉堡多条
- (NSMutableArray <NSMutableArray *> *)hasPathWithRoot:(GGZSimpleBinaryNode *)root sum:(NSInteger)sum;



@end

NS_ASSUME_NONNULL_END
