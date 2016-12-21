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

//- (FxTerm *(^)(NSString *, id))eq {
//    return ^(NSString *columnName, id value) {
//        FxTerm *subTerm = [FxTerm new];
//        [subTerm.value addObject:value];
//        
//        return subTerm;
//    };
//}

@end


@implementation FxQuery

- (FxQuery *(^)(BOOL, FxRange))create {
    return ^(BOOL unio, FxRange range){
        FxQuery *query = [FxQuery new];
        query.unio = unio;
        query.range = range;
        return query;
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



