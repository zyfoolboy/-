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

@interface ViewController ()

@property (nonatomic, strong) VEExcelTableView *excelTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.excelTableView = [[VEExcelTableView alloc] initWithFrame:CGRectMake(15, 20, Width, Height)];
    [self.view addSubview:self.excelTableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
