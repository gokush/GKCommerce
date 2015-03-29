//
//  CheckoutAddressTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutAddressTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (strong, nonatomic) Address *address;

+ (CGFloat)heightWithAddress:(Address *)address;
@end
