//
//  GGZStack.m
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import "GGZStack.h"

@interface GGZStack() {
    NSInteger _stackSize;
    NSInteger _maxMemory;
    NSInteger _topIndex;
    NSInteger _bottomIndex;
}

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation GGZStack
- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        self.array    = [NSMutableArray arrayWithCapacity:size];
        _maxMemory    = size;
        _stackSize    = 0;
        _topIndex     = 0;
        _bottomIndex  = 0;
    }
    return self;
}

- (void)push:(id)data {
    NSAssert(![self isfull], @"stack over flow");
    [self.array addObject:data];
    _stackSize++;
}

- (id)pop {
    NSAssert(![self isEmpty], @"stack is have been empty");
    id obj = [self.array objectAtIndex:(_stackSize -1)];
    [self deleteData:obj];
    return obj;
}

- (void)deleteData:(id)data {
    NSAssert([self isEmpty], @"stack is have been empty");
    if ([self.array containsObject:data]) {
        [self.array removeObject:data];
        _stackSize--;
    }
}

- (id)top {
    NSAssert([self isEmpty], @"stack is have been empty");
    return [self.array objectAtIndex:_stackSize];
}

- (NSInteger)stackCount {
    return _stackSize;
}

- (NSMutableArray *)traveseElement {
    NSAssert(![self isEmpty], @"stack is have been empty");
    _topIndex = _stackSize - 1;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:_stackSize];
    while (_topIndex >= _bottomIndex) {
        id obj = self.array[_topIndex];
        [array addObject:obj];
        _topIndex--;
    }
    return array;
}

- (id)traveseElementWithIndex:(NSInteger)index {
    NSAssert(![self isEmpty], @"stack is have been empty");
    _topIndex = _stackSize - 1;
    id resObj = nil;
    while (_topIndex == index) {
        id obj = self.array[_topIndex];
        resObj = obj;
        _topIndex--;
        break;
    }
    return resObj;
}

- (BOOL)isEmpty {
    return (_stackSize <= 0 )? YES : NO;
}

- (BOOL)isfull {
    return (_stackSize >= _maxMemory) ? YES : NO;
}

@end
