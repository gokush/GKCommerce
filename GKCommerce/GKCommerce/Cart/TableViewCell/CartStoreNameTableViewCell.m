//
//  CartStoreNameTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 12/3/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartStoreNameTableViewCell.h"

@implementation CartStoreNameTableViewCell

- (void)awakeFromNib {
    SeparatorOption *option;
    option = [SeparatorOption optionWithColor:UIColorFromRGB(0xdfdfdf)
                                  onDirection:SeparatorDirectionTop];
    [self setSeparatorWithOption:option];
    [self setSeparatorWithOption:[[SeparatorOption alloc]
                                  initWithColor:UIColorFromRGB(0xdfdfdf)
                                  marginLeftAndRight:12.0f
                                  onDirection:SeparatorDirectionBottom]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind
{
    
}

- (void)unbind
{
    
}

@end
