//
//  VEExcelCell.h
//  
//
//  Created by 林盼盼 on 2016/12/19.
//
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <JKCategories/JKCategories.h>

@interface VEExcelCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray<UILabel *> *labels;
@property (nonatomic, copy) NSArray *contents;

@end
