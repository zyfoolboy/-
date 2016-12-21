//
//  FxQuery.m
//  Test
//
//  Created by 林盼盼 on 2016/12/21.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "FxQuery.h"

@implementation FxPage



@end
@implementation FxOrderBy



@end

@implementation FxTerm


- (instancetype)init {
    self = [super init];
    if (self) {
        _type = FxQueryCst.AND;
        _value = [NSMutableArray array];
        _subTerms = [NSMutableArray array];
    }
    return self;
}
+ (FxTerm *(^)(NSString *, NSString *))create {
    return ^(NSString *type, NSString *column){
        FxTerm *fxTerm = [FxTerm new];
        fxTerm.value = [NSMutableArray array];
        fxTerm.subTerms = [NSMutableArray array];
        fxTerm.type = type;
        fxTerm.column = column;
        return fxTerm;
    };
}

- (FxTerm *(^)(FxTerm *))addTerm {
    return ^(FxTerm *subTerm) {
        [self.subTerms addObject:subTerm];
        return self;
    };
}

- (FxTerm *(^)(NSString *, id))eq {
    return ^(NSString *columnName, id value) {
        FxTerm *subTerm = FxTerm.create(FxQueryCst.EQ, columnName);
        [subTerm.value addObject:value];
        [self.subTerms addObject:subTerm];
        return self;
    };
}

- (FxTerm *(^)(NSString *, id))ne {
    return ^(NSString *columnName, id value) {
        FxTerm *subTerm = FxTerm.create(FxQueryCst.NE, columnName);
        [subTerm.value addObject:value];
        [self.subTerms addObject:subTerm];
        return self;
    };
}

@end


@implementation FxQuery

- (instancetype)init {
    self = [super init];
    if (self) {
        _range = LIST;
        _where = [FxTerm new];
        _sort = [NSMutableArray array];
        _page = [FxPage new];
    }
    return self;
}

+ (FxQuery *(^)(BOOL, FxRange))create {
    return ^(BOOL unio, FxRange range){
        FxQuery *query = [FxQuery new];
        query.sort = [NSMutableArray array];
        query.unio = unio;
        query.range = range;
        query.where = [FxTerm new];
        return query;
    };
}

- (FxQuery *(^)(NSString *,id))eq {
    return ^(NSString *columnName, id value) {
        FxTerm *subTerm = FxTerm.create(FxQueryCst.EQ, columnName);
        [subTerm.value addObject:value];
        self.where.addTerm(subTerm);
        return self;
    };
}

- (FxQuery *(^)(NSString *, id ,...))in {
    return ^(NSString *columnName, id value, ...) {
        FxTerm *subTerm = FxTerm.create(FxQueryCst.IN, columnName);
        va_list _arguments;
        va_start(_arguments, value);
        for (id key = value; key != nil; key = (__bridge id)va_arg(_arguments, void *)) {
            [subTerm.value addObject:key];
        }
        va_end(_arguments);
        self.where.addTerm(subTerm);
        return self;
    };
}

- (FxQuery *(^)(FxOrderBy *, ...))addSort {
    return ^(FxOrderBy *first,...) {
        va_list _arguments;
        va_start(_arguments, first);
        for (FxOrderBy *key = first; key != nil; key = (__bridge FxOrderBy *)va_arg(_arguments, void *)) {
            [self.sort addObject:key];
        }
        va_end(_arguments);
        return self;
    };
}

@end




