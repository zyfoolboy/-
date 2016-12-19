//
//  VEGridHeaderView.h
//  venus
//
//  Created by deyi on 2016/12/16.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <JKCategories/JKCategories.h>

@interface VEGridHeaderView : UIView

@property (nonatomic, strong) NSMutableArray<UILabel *> *labels;
@property (nonatomic, copy) NSArray *titles;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end
