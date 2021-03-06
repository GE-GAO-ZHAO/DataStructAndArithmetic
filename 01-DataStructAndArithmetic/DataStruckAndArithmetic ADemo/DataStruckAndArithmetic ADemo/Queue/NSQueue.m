//
//  NSQueue.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/3/6.
//

#import "NSQueue.h"

@interface NSQueue() {
    NSMutableArray *_array;
    NSInteger       _topIndex;
    NSInteger       _baseIndex;
    NSInteger       _maxSize;
}

@end

@implementation NSQueue

- (instancetype)initWithCapacity:(NSInteger)size;
{
    self = [super init];
    if (self) {
        _baseIndex = _topIndex  = -1;
        _baseIndex = 0;
        _maxSize   = size;
        _array     = [[NSMutableArray alloc] initWithCapacity:size];
    }
    return self;
}

- (void)push:(id)node {
    ++_topIndex;
    [_array insertObject:node atIndex:_topIndex];
}

- (id)pop {
    id node = _array[_baseIndex];
    [_array removeObjectAtIndex:_baseIndex];
    _topIndex = _topIndex - 1;
    return node;
}

- (id)front {
    return _array[_baseIndex];
}

- (id)back {
    return _array[_topIndex];
}

- (BOOL)isEmpty {
    return ([_array count] == 0) ? YES :NO;
}

@end
