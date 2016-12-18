//
//  ViewController.m
//  ExcelTable
//
//  Created by 林盼盼 on 2016/12/18.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "ViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width - 10
#define Height [UIScreen mainScreen].bounds.size.height - 5

static CGFloat const kEdgeDistance = 5;


@interface ViewController ()

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) UIScrollView *rightScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *excelView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, Width, self.view.frame.size.height - 5)];
    [self.view addSubview:excelView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, (Width) / 4, Height) style:UITableViewStylePlain];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView {
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStylePlain];
    }
    return _rightTableView;
}

- (UIScrollView *)rightScrollView {
    if (!_rightScrollView) {
        _rightScrollView = [[UIScrollView alloc] init];
        
        
        
    }
    return _rightScrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
