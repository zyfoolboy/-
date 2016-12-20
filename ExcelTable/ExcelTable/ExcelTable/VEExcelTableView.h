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


- (UIColor *)contentBackgrountColorWithRow:(NSInteger)row column:(NSInteger)column;

@optional

@end


@interface VEExcelTableView : UIView

@property (nonatomic, weak) id<VEExcelTableViewDataSource> dataSource;

- (void)setupSubviews;

@end

