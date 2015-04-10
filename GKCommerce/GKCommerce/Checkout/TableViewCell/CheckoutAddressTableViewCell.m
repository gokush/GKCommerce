//
//  CheckoutAddressTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CheckoutAddressTableViewCell.h"

@implementation CheckoutAddressTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    @weakify(self)
    [RACObserve(self, address) subscribeNext:^(id x) {
        if (nil == x)
            return;
        @strongify(self)
        NSString *addressText;
        addressText = [NSString stringWithFormat:@"收货地址：%@",
                       self.address.address];
        self.nameLabel.text = self.address.name;
        self.addressLabel.text = addressText;
        self.phoneNumberLabel.text = self.address.cellPhone;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightWithAddress:(GKAddress *)address
{
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    NSString *label;
    label = [NSString stringWithFormat:@"收货地址：%@", address.address];
    CGSize size = [label sizeWithAttributes:attributes];
    return size.height;
}
@end
