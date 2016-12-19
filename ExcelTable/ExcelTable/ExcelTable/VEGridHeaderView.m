//
//  VEGridHeaderView.m
//  venus
//
//  Created by deyi on 2016/12/16.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import "VEGridHeaderView.h"

@implementation VEGridHeaderView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        _labels = [NSMutableArray array];
        _titles = titles;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    for (int i = 0; i < _titles.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor greenColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = _titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self addSubview:label];
    }
    for (int i = 0; i < _titles.count; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == _titles.count - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(self.mas_right).offset(-.5);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top).offset(.5);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
