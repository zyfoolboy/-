//
//  FxParam.m
//  Test
//
//  Created by 林盼盼 on 2016/12/17.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "FxParam.h"

@implementation FxParam

+ (FxParam *)create {
    FxParam *param = [FxParam new];
    param.sort = [NSMutableArray array];
    return param;
}

- (FxParam *(^)(NSInteger ,NSInteger))addPage {
    return ^(NSInteger pageNo,NSInteger pageSize) {
        FxPage *page = [FxPage new];
        page.pageNo = pageNo;
        page.pageSize = pageSize;
        self.page = page;
        return self;
    };
}

- (FxParam *(^)(BOOL))addUnion {
    return ^(BOOL unio) {
        self.unio = unio;
        return self;
    };
}

- (FxParam *(^)(FxSort *,...))addSort {
    return ^(FxSort *first,...) {
        va_list _arguments;
        va_start(_arguments, first);
        for (FxSort *key = first; key != nil; key = (__bridge FxSort *)va_arg(_arguments, void *)) {
            [self.sort addObject:key];
        }
        va_end(_arguments);
        return self;
    };
}

@end

@implementation FxSort

@end

@implementation FxPage

@end

@implementation FxTerm

@end



