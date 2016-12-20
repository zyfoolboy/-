//
//  VEExcelCell.m
//  
//
//  Created by 林盼盼 on 2016/12/19.
//
//

#import "VEExcelCell.h"

static CGFloat const kPadding = .5;

@interface VEExcelCell ()

@property (assign, nonatomic) NSInteger line;

@end

@implementation VEExcelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier count:(NSInteger)count {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _line = count;
        _labels = [NSMutableArray array];
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < _line; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self addSubview:label];
    }
    for (int i = 0; i < _line; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-kPadding);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == _line - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(kPadding);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(self.mas_right).offset(-kPadding);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(kPadding);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-kPadding);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-kPadding);
                make.width.equalTo(_labels[i + 1]);
            }];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
