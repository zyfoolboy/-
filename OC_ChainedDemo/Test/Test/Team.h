//
//  Team.h
//  Test
//
//  Created by 林盼盼 on 2016/12/17.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;

@interface Team : NSObject

@property (nonatomic, strong) NSMutableArray *students;

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) Team *(^addStu)(Student *stu);

@end
