//
//  AddressListTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "AddressListTableViewCell.h"

@implementation AddressListTableViewCell

- (void)setAddress:(Address *)address
{
    if (_address != address) {
        _address = address;
        
        self.nameLabel.text = address.name;
        self.cellPhoneLabel.text = address.cellPhone;
        self.addressLabel.text = address.address;
        self.selectedView.selected = address.isDefault;
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
