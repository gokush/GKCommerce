//
//  MallCategoryCell.h
//  goku-commerce.com
//
//  Created by wupeng on 8/8/14.
//  Copyright (c) 2014 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableViewCell.h"
#import "ProductCategory.h"

@interface ProductCategoryTableViewCell : SKSTableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView *coverImage;
@property (nonatomic, strong) ProductCategory *productCategory;
@end
