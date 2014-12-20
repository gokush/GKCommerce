//
//  CheckoutShippingTableViewCell.h
//  GKCommerce
//
//  Created by goku on 14/11/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"
#import "UIBindableTableViewCell.h"

@class CheckoutShippingTableViewCell;
@protocol CheckoutShippingTableViewCell <NSObject>

- (void)didSelectCheckoutShippingTableViewCell:
    (CheckoutShippingTableViewCell *)cell;
@end

@interface CheckoutShippingTableViewCell : UITableViewCell
<UIBindableTableViewCell>

@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) id<CheckoutShippingTableViewCell> delegate;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *freightLabel;
@end
