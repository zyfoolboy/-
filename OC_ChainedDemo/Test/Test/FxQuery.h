//
//  FxQuery.h
//  Test
//
//  Created by 林盼盼 on 2016/12/21.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FxQueryCst.h"


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

@end


@interface FxQuery : NSObject

@property (nonatomic, assign) BOOL unio;
@property (nonatomic, assign) FxRange range;
@property (nonatomic, strong) FxTerm *where;
@property (nonatomic, strong) NSMutableArray<FxOrderBy *> *sort;
@property (nonatomic, strong) FxPage *page;

+ (FxQuery *(^)(BOOL ,FxRange))create;
- (FxQuery *(^)(NSString *,id))eq;
- (FxQuery *(^)(NSString *, id ,...))in;

- (FxQuery *(^)(FxOrderBy *, ...))addSort;

@end
