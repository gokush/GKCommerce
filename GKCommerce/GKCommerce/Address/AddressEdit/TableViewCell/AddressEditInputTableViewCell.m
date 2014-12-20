//
//  AddressEditInputTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "AddressEditInputTableViewCell.h"

@implementation AddressEditInputTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind
{
    [self.address addObserver:self forKeyPath:@"district"
                        options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self.address removeObserver:self forKeyPath:@"district"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if (self.address.province && self.address.city &&
        self.address.district)
    self.inputTextField.text = [NSString stringWithFormat:@"%@%@%@",
                                self.address.province.name,
                                self.address.city.name,
                                self.address.district.name];
}

@end
