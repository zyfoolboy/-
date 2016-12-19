//
//  VEStaticTableView.m
//  venus
//
//  Created by deyi on 2016/12/19.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import "VEStaticTableView.h"
#import "VEGridTableCell.h"

static NSString * const cellIdentifyer = @"Cell";

@implementation VEStaticTableView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizesSubviews = YES;
        self.backgroundColor = [UIColor whiteColor];
        _headerTitles = titles;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    _headerView = [[VEGridHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.jk_width, 20) titles:_headerTitles];
    [self addSubview:_headerView];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.jk_width, self.jk_height) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"VEGridTableCell" bundle:nil] forCellReuseIdentifier:cellIdentifyer];
}

#pragma mark - tableviewdatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VEGridTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifyer forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)setContentArray:(NSMutableArray *)contentArray {
    _contentArray = contentArray;
    if (!_contentArray) {
        return;
    }
    [_tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
