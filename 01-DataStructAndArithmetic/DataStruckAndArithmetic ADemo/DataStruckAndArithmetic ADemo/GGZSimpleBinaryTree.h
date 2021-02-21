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

- (instancetype)initWithLeft:(GGZSimpleBinaryNode *)left right:(GGZSimpleBinaryNode *)right data:(id)data;
@end

@interface GGZSimpleBinaryTree : NSObject

@end

NS_ASSUME_NONNULL_END
