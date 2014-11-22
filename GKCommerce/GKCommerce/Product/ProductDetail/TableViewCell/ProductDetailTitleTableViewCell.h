//
//  ProductDetailTitleTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14/10/22.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailTableViewCell.h"

@interface ProductDetailTitleTableViewCell : ProductDetailTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIButton *favor;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *marketPrice;
@property (strong, nonatomic) IBOutlet UILabel *postage;
@property (strong, nonatomic) IBOutlet UILabel *sales;
@property (strong, nonatomic) IBOutlet UILabel *address;
@end
