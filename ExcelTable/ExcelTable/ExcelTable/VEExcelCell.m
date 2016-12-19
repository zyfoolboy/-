//
//  VEExcelCell.m
//  
//
//  Created by 林盼盼 on 2016/12/19.
//
//

#import "VEExcelCell.h"

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

- (void)setContents:(NSArray *)contents {
    _contents = contents;
    if (!_contents) {
        return;
    }
    for (int i = 0; i < _contents.count; i++) {
        _labels[i].text = _contents[i];
    }
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < _line; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor greenColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [_labels addObject:label];
        [self.contentView addSubview:label];
    }
    for (int i = 0; i < _line; i++) {
        if (i == 0) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(1);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
                make.width.equalTo(_labels[i + 1]);
            }];
        } else if (i == _line - 1) {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(self.mas_right).offset(-.5);
                make.width.equalTo(_labels[0]);
            }];
        } else {
            [_labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_labels[i - 1].mas_right).offset(.5);
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom).offset(-.5);
                make.right.equalTo(_labels[i + 1].mas_left).offset(-.5);
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
