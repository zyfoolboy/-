//
//  Team.m
//  Test
//
//  Created by 林盼盼 on 2016/12/17.
//  Copyright © 2016年 林盼盼. All rights reserved.
//

#import "Team.h"
#import "Student.h"

@implementation Team

+ (Team *)create {
    Team *team = [Team new];
    team.students = [NSMutableArray array];
    return team;
}

- (Team *(^)(Student *))addStu {
    return ^(Student *stu) {
        [self.students addObject:stu];
        return self;
    };
}

- (Student *(^)(NSString *))add {
    return ^(NSString *name) {
        Student *stu = [Student new];
        stu.name = name;
        return stu;
    };
}

@end
