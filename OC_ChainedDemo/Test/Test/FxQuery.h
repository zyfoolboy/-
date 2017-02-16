//
//  FxQuery.h
//  Test
//
//  Created by ZYong on 2016/12/21.
//  Copyright © 2016年 ZYong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define orderBy(value, ...) fxSort(value, __VA_ARGS__, nil)
#define in(value, ...) fxIn(value, __VA_ARGS__, nil)
#define between(value, ...) fxBetween(value, __VA_ARGS__, nil)
#define fields(...) fxFields(__VA_ARGS__, nil)
#define groups( ...) fxGroups(__VA_ARGS__, nil)

typedef NS_ENUM(NSUInteger, FxRange) {
    BASIC = 1,
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

@interface FxPage : NSObject

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger currentRecord;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, assign) NSInteger totalRecord;

@end

@interface FxOrderBy : NSObject

@property (nonatomic, copy) NSString *column;
@property (nonatomic, copy) NSString *seq;

+ (FxOrderBy *(^)(NSString *, NSString *))create;

@end

@interface FxTerm : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) NSMutableArray<FxTerm *> *subTerms;
@property (nonatomic, copy) NSString *column;
@property (nonatomic, strong) NSMutableArray *value;

+ (FxTerm *(^)(NSString *, NSString *))create;
- (FxTerm *(^)(FxTerm *))addTerm;
- (FxTerm *(^)(NSString *, id))eq;
- (FxTerm *(^)(NSString *, id))ne;
- (FxTerm *(^)(NSString *, id))le;
- (FxTerm *(^)(NSString *, id))lt;
- (FxTerm *(^)(NSString *, id))ge;
- (FxTerm *(^)(NSString *, id))gt;
- (FxTerm *(^)(NSString *, id , ...))fxIn;
- (FxTerm *(^)(NSString *, id))like;
- (FxTerm *(^)(NSString *, id , ...))fxBetween;
- (FxTerm *(^)())and;
- (FxTerm *(^)())or;

@end


@interface FxQuery : NSObject

@property (nonatomic, assign) BOOL unio;
@property (nonatomic, assign) BOOL ignoreUnionField;
@property (nonatomic, assign) BOOL inception;
@property (nonatomic, strong) NSMutableArray<NSString *> *fields;
@property (nonatomic, strong) NSMutableArray<NSString *> *groups;
@property (nonatomic, assign) FxRange range;
@property (nonatomic, strong) FxTerm *where;
@property (nonatomic, strong) NSMutableArray<FxOrderBy *> *sort;
@property (nonatomic, strong) FxPage *page;

+ (FxQuery *(^)(BOOL ,FxRange))create;
- (FxQuery *(^)(NSString *, ...))fxFields;
- (FxQuery *(^)(NSString *, ...))fxGroups;
- (FxQuery *(^)(NSString *))max;
- (FxQuery *(^)(NSString *))min;
- (FxQuery *(^)(NSString *))count;
- (FxQuery *(^)(NSString *))sum;
- (FxQuery *(^)(NSString *))avg;
- (FxQuery *(^)(NSString *))distinct;
- (FxQuery *(^)(NSString *, id))eq;
- (FxQuery *(^)(NSString *, id))ne;
- (FxQuery *(^)(NSString *, id))le;
- (FxQuery *(^)(NSString *, id))lt;
- (FxQuery *(^)(NSString *, id))ge;
- (FxQuery *(^)(NSString *, id))gt;
- (FxQuery *(^)(NSString *, id , ...))fxIn;
- (FxQuery *(^)(NSString *, id))like;
- (FxQuery *(^)(NSString *, id , ...))fxBetween;
- (FxQuery *(^)(NSString *, ...))fxSort;
- (FxQuery *(^)(BOOL))withUnion;
- (FxQuery *(^)(FxRange))withRange;
- (FxQuery *(^)(NSInteger))pageNo;
- (FxQuery *(^)(NSInteger))pageSize;
- (FxQuery *(^)(FxTerm *))addSubTerm;
- (FxQuery *(^)())and;
- (FxQuery *(^)())or;
- (FxQuery *(^)())selectBasic;
- (FxQuery *(^)())selectList;
- (FxQuery *(^)())selectMore;

@end
