//
//  ViewController.m
//  Test
//
//  Created by 林盼盼 on 2016/12/17.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "ViewController.h"
#import "Team.h"
#import "Student.h"
#import "FxQuery.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    FxSort *sort = [FxSort new];
//    FxSort *sort1 = [FxSort new];
//    FxParam *fx = FxParam.create.addPage(1, 2).addUnion(NO).addSort(sort, sort1, nil);
    
    FxQuery *query = FxQuery.create(YES, BASIC).in(@"1" ,@"2", @"3", nil);
    
  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
