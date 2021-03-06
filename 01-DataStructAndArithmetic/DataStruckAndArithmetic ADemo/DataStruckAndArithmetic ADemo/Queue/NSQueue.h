//
//  NSQueue.h
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/3/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSQueue : NSObject
@property (nonatomic,assign)                NSInteger size;
@property (nonatomic,assign,getter=isEmpty) BOOL empty;

- (instancetype)initWithCapacity:(NSInteger)size;
- (void)push:(id)node; /*队列末尾添加元素*/
- (id)pop; /*从队列首部移除元素*/
- (id)front;/*返回队列首部的元素，但是不删除该元素*/
- (id)back;/*返回队列末尾的元素，但是不删除该元素*/

@end

NS_ASSUME_NONNULL_END
