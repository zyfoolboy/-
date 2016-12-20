//
//  ViewController.m
//  ExcelTable
//
//  Created by 林盼盼 on 2016/12/18.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "ViewController.h"
#import "VEExcelTableView.h"

#define Width [UIScreen mainScreen].bounds.size.width - 30
#define Height [UIScreen mainScreen].bounds.size.height - 20

@interface ViewController () <VEExcelTableViewDataSource, VEExcelTableViewDelegate>

@property (nonatomic, strong) VEExcelTableView *excelTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.excelTableView = [[VEExcelTableView alloc] initWithFrame:CGRectMake(15, 20, Width, Height) withColumn:7];
    self.excelTableView.dataSource = self;
    self.excelTableView.delegate = self;
    [self.view addSubview:self.excelTableView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.excelTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.equalTo(self.view.mas_left).offset(15);
        make.width.mas_equalTo(@(Width));
        make.height.mas_equalTo(@(Height));
        //        make.right.equalTo(self.view.mas_right).offset(-15);
        //        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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
