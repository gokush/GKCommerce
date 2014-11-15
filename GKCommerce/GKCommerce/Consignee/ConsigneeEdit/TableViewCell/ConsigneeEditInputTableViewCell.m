//
//  ConsigneeEditInputTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ConsigneeEditInputTableViewCell.h"

@implementation ConsigneeEditInputTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind
{
    [self.consignee addObserver:self forKeyPath:@"district"
                        options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self.consignee removeObserver:self forKeyPath:@"district"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if (self.consignee.province && self.consignee.city &&
        self.consignee.district)
    self.inputTextField.text = [NSString stringWithFormat:@"%@%@%@",
                                self.consignee.province.name,
                                self.consignee.city.name,
                                self.consignee.district.name];
}

@end
