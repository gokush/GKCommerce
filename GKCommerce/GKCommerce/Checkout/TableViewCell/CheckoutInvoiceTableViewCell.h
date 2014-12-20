//
//  InvoiceTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Invoice.h"
#import "UIBindableTableViewCell.h"

@interface CheckoutInvoiceTableViewCell : UITableViewCell
<UIBindableTableViewCell>

@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) Cart *cart;
@end
