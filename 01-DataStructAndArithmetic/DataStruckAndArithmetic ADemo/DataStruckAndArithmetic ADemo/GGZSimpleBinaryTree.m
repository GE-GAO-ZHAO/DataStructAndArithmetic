//
//  GGZSimpleBinaryTree.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import "GGZSimpleBinaryTree.h"

@implementation GGZSimpleBinaryTree

@end


@implementation GGZSimpleBinaryNode

- (instancetype)initWithLeft:(GGZSimpleBinaryNode *)left right:(GGZSimpleBinaryNode *)right data:(id)data {
    self = [super init];
    if (self) {
        self.left = left;
        self.right = right;
        self.data = data;
    }
    return self;
}
@end
