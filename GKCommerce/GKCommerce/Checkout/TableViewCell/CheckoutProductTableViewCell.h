//
//  CheckoutProductTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CheckoutProductTableViewCell;
@protocol CheckoutProductTableViewCellDelegate <NSObject>

- (void)checkoutProductTableViewCell:(CheckoutProductTableViewCell *)cell
                       didTapProduct:(Product *)product;
@end

@interface CheckoutProductTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *qtyLabel;
@property (strong, nonatomic) IBOutlet UIButton *productPhotoButton;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *shopPriceLabel;
@property (strong, nonatomic) CartItem *item;
@property (strong, nonatomic) id<CheckoutProductTableViewCellDelegate> delegate;
@end
