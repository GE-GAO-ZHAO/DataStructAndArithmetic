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
- (void)previousOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)middleOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)postOrderTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)hierarchyTraverseWithRootNode:(GGZSimpleBinaryNode *)node;
- (void)middleOrderTraverseByStackWithRootNode:(GGZSimpleBinaryNode *)node;


@end

NS_ASSUME_NONNULL_END
