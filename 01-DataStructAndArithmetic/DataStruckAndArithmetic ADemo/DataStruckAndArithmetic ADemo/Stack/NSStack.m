//
//  NSStack.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/3/4.
//

#import "NSStack.h"

@interface GGZNode : NSObject
@property (nonnull,strong)      id data;
@property (nonnull,strong) GGZNode *next;
@end

@interface NSStack() {
    NSInteger        _topIndex;
    NSInteger        _baseIndex;
    NSInteger        _maxSize;/*可选*/
    NSMutableArray   <GGZNode *>*_array;
}

@end

@implementation NSStack
- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        _topIndex  = -1;
        _baseIndex = 0;
        _maxSize   = size;
        _array = [[NSMutableArray alloc] initWithCapacity:size];
    }
    return self;
}

- (void)push:(id)data {
    ++_topIndex;
    _array[_topIndex] = data;
}

- (id)pop {
    NSAssert([_array count] > 0, @"data is not allow nil!");
    id obj = _array[_topIndex];
    [_array removeObjectAtIndex:_topIndex];
    --_topIndex;
    return obj;
}

- (id)top {
    return (_topIndex <= [_array count] && _array[_topIndex]) ? _array[_topIndex] : nil ;
}

- (id)traveseElementWithIndex:(NSInteger)index {
    NSAssert([_array count] > 0 && index <= _topIndex, @"data is not allow nil!");
    return _array[index];
}

- (BOOL)isEmpty {
    return (_topIndex == _baseIndex || [_array count] == 0) ? YES : NO;
}

@end
