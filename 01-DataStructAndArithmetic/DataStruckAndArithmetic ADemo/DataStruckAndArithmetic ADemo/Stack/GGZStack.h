//
//  GGZStack.h
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GGZStack : NSObject
@property (nonatomic,assign,getter=isfull) BOOL full;
@property (nonatomic,assign,getter=isEmpty) BOOL empty;
- (instancetype)initWithSize:(NSInteger)size;
- (void)push:(id)data;
- (id)pop;
- (id)top;
- (NSInteger)stackCount;
- (NSMutableArray *)traveseElement;
- (id)traveseElementWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
