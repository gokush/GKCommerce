//
//  CheckoutChoiceAddressTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 3/30/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutChoiceAddressTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet
NSLayoutConstraint *mobilePhoneNumberTrailling;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *addressTrailling;
@end
