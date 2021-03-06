//
//  ViewController.m
//  ExcelTable
//
//  Created by 林盼盼 on 2016/12/18.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "ViewController.h"
#import "VEExcelTableView.h"
#import <MJRefresh/MJRefresh.h>

#define Width [UIScreen mainScreen].bounds.size.width - 30
#define Height [UIScreen mainScreen].bounds.size.height - 20

@interface ViewController () <VEExcelTableViewDataSource, VEExcelTableViewDelegate>

@property (nonatomic, strong) VEExcelTableView *excelTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.excelTableView = [[VEExcelTableView alloc] initWithFrame:CGRectMake(15, 20, Width, Height) withColumn:7];
    self.excelTableView = [[VEExcelTableView alloc] init];
    self.excelTableView.dataSource = self;
    self.excelTableView.vedelegate = self;
    [self.view addSubview:self.excelTableView];
    
    [self.excelTableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(20, 15, 0, 15));
//        make.top.equalTo(self.view.mas_top).offset(20);
//        make.left.equalTo(self.view.mas_left).offset(15);
//        make.right.equalTo(self.view.mas_right).offset(-15);
//        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    
    self.excelTableView.mj_header = ({
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
        //header.lastUpdatedTimeLabel.hidden = YES;
        //header.stateLabel.hidden = YES;
        header;
    });
//    [self.excelTableView.mj_header beginRefreshing];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (NSInteger)excelViewWithColumn {
    return 7;
}

- (NSInteger)excelViewWithRow {
    return 50;
}

- (UIColor *)contentBackgrountColorWithRow:(NSInteger)row column:(NSInteger)column {
    if (column == 1) {
        return [UIColor yellowColor];
    }
    return [UIColor redColor];
}

- (UIColor *)textColorWithRow:(NSInteger)row column:(NSInteger)column {
    return [UIColor whiteColor];
}

- (CGFloat)heightForRowAtRow:(NSInteger)row {
    if (row == 0) {
        return 20;
    }
    return 30;
}

- (NSString *)textWithRow:(NSInteger)row column:(NSInteger)column {
    return @"abc";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
