//
//  AddressListTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKAddressCommon.h"
#import "AddressListTableViewCellSelected.h"

@interface AddressListTableViewCell : UITableViewCell

@property (strong, nonatomic) GKAddress *address;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellPhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet AddressListTableViewCellSelected
    *selectedView;
@end
