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
    
    FxQuery *query = FxQuery.create(YES, BASIC).in(@"1" ,@"2", @"3");
    
    FxQuery *params  =  FxQuery.create(YES, LIST)
                                .pageNo(1)
                                .pageSize(10)
                                .and()
                                .lt(@"rechargeTime", @"2016-12-30 10:05:32")
                                .gt(@"rechargeTime", @"2016-08-10 10:05:32")
                                .eq(@"memberId", @1)
                                .orderBy(@"rechargeTime", @"DESC");
    
    Team *t = [Team new];
    t.students = [NSMutableArray array];
    Student *stu = [Student new];
    stu.name = @"abc";
    t.addStu(stu);
    
    double (^distanceFromRateAndTime)(double rate, double time);
    
    // Create and assign the block
    distanceFromRateAndTime = ^double(double rate, double time) {
        return rate * time;
    };
    // Call the block
//    distanceFromRateAndTime(35, 1.5);
    
    NSLog(@"A car driving 35 mph will travel "
          @"%.2f miles in 1.5 hours.", distanceFromRateAndTime(35, 1.5));

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
