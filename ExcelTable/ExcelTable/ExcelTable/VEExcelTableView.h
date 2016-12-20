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



@end

@protocol VEExcelTableViewDataSource <NSObject>

@required



@optional

- (UIColor *)topTitleHeaderBackgroundColor;
- (UIColor *)leftHeaderColorWithRow:(NSInteger)row;
- (UIColor *)topHeaderBackgroundColorWithColumn:(NSInteger)column;
- (UIColor *)contentBackgrountColorWithRow:(NSInteger)row column:(NSInteger)column;

@end


@interface VEExcelTableView : UIView

@property (nonatomic, weak) id<VEExcelTableViewDataSource> dataSource;


@end

