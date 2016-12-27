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

- (NSInteger)count {
    return _count;
}

- (Team *(^)(Student *))addStu {
   return ^(Student *stu) {
        //Team *team = [Team new];
//        self.students = [NSMutableArray array];
        [self.students addObject:stu];
        return self;
    };
    //return _addStu;
}


@end
