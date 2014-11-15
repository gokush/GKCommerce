//
//  ConsigneeListTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ConsigneeListTableViewCell.h"

@implementation ConsigneeListTableViewCell

- (void)setConsignee:(Consignee *)consignee
{
    if (_consignee != consignee) {
        _consignee = consignee;
        
        self.nameLabel.text = consignee.name;
        self.cellPhoneLabel.text = consignee.cellPhone;
        self.addressLabel.text = consignee.address;
        self.selectedView.selected = consignee.defaultConsignee;
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
