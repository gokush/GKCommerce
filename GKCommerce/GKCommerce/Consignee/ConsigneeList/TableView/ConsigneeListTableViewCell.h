//
//  ConsigneeListTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Consignee.h"
#import "ConsigneeListTableViewCellSelected.h"

@interface ConsigneeListTableViewCell : UITableViewCell

@property (strong, nonatomic) Consignee *consignee;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellPhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet ConsigneeListTableViewCellSelected
    *selectedView;
@end
