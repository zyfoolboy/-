//
//  FxQueryCst.h
//  Test
//
//  Created by 林盼盼 on 2016/12/21.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FxRange) {
    BASIC = 0,
    LIST,
    MORE,
    HIDDEN
};

@interface FxQueryCst : NSObject

+ (NSString *)AND;
+ (NSString *)OR;
+ (NSString *)EQ;
+ (NSString *)NE;
+ (NSString *)GE;
+ (NSString *)LE;
+ (NSString *)GT;
+ (NSString *)LT;
+ (NSString *)IN;
+ (NSString *)LIKE;
+ (NSString *)BETWEEN;
+ (NSString *)ASC;
+ (NSString *)DESC;



@end
