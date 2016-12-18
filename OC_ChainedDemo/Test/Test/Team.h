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

@property (nonatomic, strong) Student *(^add)(NSString *name);
//@property (nonatomic, strong) Team *(^addStu)(Student *name);

- (Team *(^)(Student *))addStu;

+ (Team *)create;

@end
