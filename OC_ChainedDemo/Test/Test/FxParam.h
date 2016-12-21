////
////  FxParam.h
////  Test
////
////  Created by 林盼盼 on 2016/12/17.
////  Copyright © 2016年 林盼盼. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//@interface FxPage : NSObject
//
//@property (nonatomic, assign) NSInteger pageNo;
//@property (nonatomic, assign) NSInteger pageSize;
//
//@end
//
//@interface FxTerm : NSObject
//
//@property (nonatomic, copy) NSString *type;
//@property (nonatomic, strong) NSMutableArray<FxTerm *> *subTerms;
//@property (nonatomic, copy) NSString *column;
//@property (nonatomic, strong) NSMutableArray *value;
//
//@end
//
//@interface FxSort : NSObject
//
//@property (nonatomic, copy) NSString *column;
//@property (nonatomic, copy) NSString *seq;
//
//@end
//
//
//@interface FxParam : NSObject
//
//@property (nonatomic, strong) FxPage *page;
//@property (nonatomic, assign) BOOL unio;
//@property (nonatomic, assign) NSInteger range;
//@property (nonatomic, strong) FxTerm *where;
//@property (nonatomic, strong) NSMutableArray<FxSort *> *sort;
//
//
//+ (FxParam *)create;
//- (FxParam *(^)(NSInteger ,NSInteger))addPage;
//- (FxParam *(^)(BOOL))addUnion;
//- (FxParam *(^)(FxSort *, ...))addSort;
//
//@end
