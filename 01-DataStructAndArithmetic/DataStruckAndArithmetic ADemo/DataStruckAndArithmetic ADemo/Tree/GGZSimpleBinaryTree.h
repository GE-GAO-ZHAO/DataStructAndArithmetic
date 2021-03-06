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
- (void)inserTreeNodeWithCurNode:(GGZSimpleBinaryNode *)curNode left:(GGZSimpleBinaryNode *)left right:(GGZSimpleBinaryNode *)right;

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
  



@end

NS_ASSUME_NONNULL_END
