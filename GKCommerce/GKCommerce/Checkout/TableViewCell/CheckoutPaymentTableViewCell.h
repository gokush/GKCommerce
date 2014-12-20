//
//  CheckoutPaymentTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"
#import "UIBindableTableViewCell.h"
#import "PaymentBalance.h"

@interface CheckoutPaymentTableViewCell : UITableViewCell
<UIBindableTableViewCell>

@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@end
