//
//  VEExcelTableView.h
//  venus
//
//  Created by deyi on 2016/12/19.
//  Copyright © 2016年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <JKCategories/JKCategories.h>

@protocol VEExcelTableViewDelegate <NSObject>
@required
- (NSString *)textWithRow:(NSInteger)row column:(NSInteger)column;
@optional
@end

@protocol VEExcelTableViewDataSource <NSObject>

@required

- (UIColor *)contentBackgrountColorWithRow:(NSInteger)row column:(NSInteger)column;
- (UIColor *)textColorWithRow:(NSInteger)row column:(NSInteger)column;

@optional

- (CGFloat)heightForRowAtRow:(NSInteger)row;

@end


@interface VEExcelTableView : UIView

@property (nonatomic, weak) id<VEExcelTableViewDataSource> dataSource;
@property (nonatomic, weak) id<VEExcelTableViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withColumn:(NSInteger)column;

@end

