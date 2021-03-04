//
//  GGZListNode.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

#import "GGZListNode.h"

@implementation GGZListNode

- (instancetype)initWithKey:(nullable NSString *)key data:(id)data next:(nullable GGZListNode *)node {
    self = [super init];
    if (self) {
        self.key  = key;
        self.data = data;
        self.next = node;
    }
    return self;
}
@end
