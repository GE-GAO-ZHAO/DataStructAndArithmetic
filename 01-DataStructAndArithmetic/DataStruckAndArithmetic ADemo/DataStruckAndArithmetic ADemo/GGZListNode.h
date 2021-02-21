//
//  GGZListNode.h
//  linked list LinkedListDemo
//
//  Created by gegaozhao on 2021/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GGZListNode : NSObject

@property (nonatomic,copy)     NSString     *key;
@property (nonatomic,strong)   id           data;
@property (nonatomic,strong)   GGZListNode  *next;

- (instancetype)initWithKey:(nullable NSString *)key data:(id)data next:(nullable GGZListNode *)node;

@end

NS_ASSUME_NONNULL_END
