//
//  VEStaticTableView.h
//  venus
//
//  Created by deyi on 2016/12/19.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VEGridHeaderView.h"

@interface VEStaticTableView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) VEGridHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *headerTitles;
@property (nonatomic, strong) NSMutableArray *contentArray;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end
