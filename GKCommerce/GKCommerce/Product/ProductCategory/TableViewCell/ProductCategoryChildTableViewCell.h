//
//  MallSecondCategoryCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductCategoryChildTableViewCellGrid;
@class ProductCategoryChildTableViewCell;

@protocol ProductCategoryChildTableViewCellDelegate <NSObject>
- (void)productCategoryChildTableViewCell:(ProductCategoryChildTableViewCell *)cell
didSelectedAtRow:(NSInteger)row column:(NSInteger)column;
@end

@interface ProductCategoryChildTableViewCell : UITableViewCell

/**
 `ProductCategory`的数组
 */
@property (strong, nonatomic) NSArray *categories;
@property (assign, nonatomic) NSInteger row;
@property (strong, nonatomic)
    id<ProductCategoryChildTableViewCellDelegate> delegate;
@property (strong, nonatomic) ProductCategoryChildTableViewCellGrid *gridView;

@end
