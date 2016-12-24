//
//  VEExcelTableView.m
//  venus
//
//  Created by deyi on 2016/12/19.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import "VEExcelTableView.h"
#import "VEExcelTitleCell.h"
#import <MJRefresh/MJRefresh.h>

static NSString * const cellIdentifyer = @"Cell";
static NSString * const rightCellIdentifyer = @"rightCell";
static CGFloat const kPadding = .5;

@interface VEGridHeaderView ()

@property (nonatomic, assign) NSInteger contentColumn;

@end

@implementation VEGridHeaderView


- (instancetype)initWithFrame:(CGRect)frame withColumn:(NSInteger)column {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _labels = [NSMutableArray array];
        _contentColumn = column;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    for (int i = 0; i < _contentColumn; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self addSubview:label];
    }
    for (int i = 0; i < _contentColumn; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == _contentColumn - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(self.mas_right).offset(-.5);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        }
    }
}

@end

@interface VEExcelCell ()

@end

@implementation VEExcelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier count:(NSInteger)count {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _labels = [NSMutableArray array];
        [self setupSubviewsAtCount:count];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setupSubviewsAtCount:(NSInteger)count {
    self.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self addSubview:label];
    }
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-kPadding);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == count - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(kPadding);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(self.mas_right).offset(-kPadding);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(kPadding);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-kPadding);
                make.width.equalTo(_labels[i + 1]);
            }];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

@interface VEExcelTableView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UIScrollView *rightView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, assign) NSInteger contentColumn;

@end

@implementation VEExcelTableView


- (instancetype)initWithFrame:(CGRect)frame withColumn:(NSInteger)column {
    self = [super initWithFrame:frame];
    if (self) {
        _contentColumn = column;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, (self.jk_width / 4) + kPadding, self.jk_height) style:UITableViewStylePlain];
    _leftTableView.tableFooterView = [UIView new];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    //_leftTableView.bounces = NO;
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_leftTableView setSeparatorInset:UIEdgeInsetsZero];
    [_leftTableView setLayoutMargins:UIEdgeInsetsZero];
    [_leftTableView registerNib:[UINib nibWithNibName:@"VEExcelTitleCell" bundle:nil] forCellReuseIdentifier:cellIdentifyer];
    [self addSubview:_leftTableView];
    _rightView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.jk_width / 4, 0, (self.jk_width / 4 * 3) + kPadding, self.jk_height)];
    //_rightView.contentSize = CGSizeMake(self.jk_width / 4 * _contentColumn, self.jk_height);
    _rightView.delegate = self;
    //_rightView.bounces = NO;
    _rightView.showsHorizontalScrollIndicator = NO;
    _rightView.showsVerticalScrollIndicator = NO;
    [self addSubview:_rightView];
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.jk_width / 4 * _contentColumn, self.jk_height) style:UITableViewStylePlain];
    _rightTableView.tableFooterView = [UIView new];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    //_rightTableView.bounces = NO;
    [_rightTableView setSeparatorInset:UIEdgeInsetsZero];
    [_rightTableView setLayoutMargins:UIEdgeInsetsZero];
    [_rightView addSubview:_rightTableView];
}

#pragma mark - tableviewdatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.vedelegate excelViewWithRow] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        VEExcelTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifyer forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.backgroundColor = [self.dataSource contentBackgrountColorWithRow:indexPath.row + 1 column:0];
        cell.titleLabel.text = [self.vedelegate textWithRow:indexPath.row + 1 column:0];
        cell.titleLabel.textColor = [self.dataSource textColorWithRow:indexPath.row + 1 column:0];
        return cell;
    } else {
        VEExcelCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCellIdentifyer];
        if (!cell) {
            cell = [[VEExcelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightCellIdentifyer count:self.contentColumn - 1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        for (int i = 0; i < cell.labels.count; i++) {
            cell.labels[i].backgroundColor = [self.dataSource contentBackgrountColorWithRow:indexPath.row + 1 column:i + 1];
            cell.labels[i].text = [self.vedelegate textWithRow:indexPath.row + 1 column:i + 1];
            cell.labels[i].textColor = [self.dataSource textColorWithRow:indexPath.row + 1 column:i + 1];
        }
        
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) {
        VEGridHeaderView *headerView = [[VEGridHeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.jk_width, 20) withColumn:self.contentColumn - 1];
        
        for (int i = 0; i < self.self.contentColumn - 1; i++) {
            headerView.labels[i].backgroundColor = [self.dataSource contentBackgrountColorWithRow:0 column:i + 1];
            headerView.labels[i].text = [self.vedelegate textWithRow:0 column:i + 1];
            headerView.labels[i].textColor = [self.dataSource textColorWithRow:0 column:i + 1];
        }
        
        return headerView;
    } else {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.jk_width, 20)];
        view.backgroundColor = [UIColor lightGrayColor];
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [self.dataSource contentBackgrountColorWithRow:0 column:0];
        label.textColor = [self.dataSource textColorWithRow:0 column:0];
        label.font = [UIFont systemFontOfSize:13];
        label.text = [self.vedelegate textWithRow:0 column:0];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_top).offset(kPadding);
            make.left.equalTo(view.mas_left).offset(kPadding);
            make.right.equalTo(view.mas_right).offset(-1);
            make.bottom.equalTo(view.mas_bottom).offset(-kPadding);
        }];
        return view;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataSource respondsToSelector:@selector(heightForRowAtRow:)]) {
        return [self.dataSource heightForRowAtRow:indexPath.row + 1];
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self.dataSource respondsToSelector:@selector(heightForRowAtRow:)]) {
        return [self.dataSource heightForRowAtRow:0];
    }
    return 30;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView == self.leftTableView) {
        self.rightTableView.contentOffset = scrollView.contentOffset;
    } else {
        self.leftTableView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.y < 0) {
        self.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.y < -20) {
        [self.mj_header beginRefreshing];
    }
}

- (void)setVedelegate:(id<VEExcelTableViewDelegate>)vedelegate {
    _vedelegate = vedelegate;
    _contentColumn = [vedelegate excelViewWithColumn];
    [self setupSubviews];
    [self commonInit];
}


- (void)commonInit {
    [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width).multipliedBy(0.25);
        make.height.mas_equalTo(@200);
        //make.bottom.equalTo(self.mas_bottom);
    }];
    
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(_leftTableView.mas_right);
        //make.right.equalTo(self.mas_right);
        make.width.equalTo(self.mas_width).multipliedBy(0.75);
        make.height.mas_equalTo(@200);
        //make.bottom.equalTo(self.mas_bottom);
    }];
    
    [_rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_rightView);
        make.height.equalTo(_leftTableView.mas_height);
        make.width.equalTo(_leftTableView.mas_width).multipliedBy(_contentColumn - 1);
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
