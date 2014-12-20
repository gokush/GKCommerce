//
//  MineOrderDetailGoodCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-20.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "OrderDetailProductTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation OrderDetailProductTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
}

- (void)fillData
{
    CartItem *item;
    NSURL *coverImageURL;
    
    item = (CartItem *)[self.order.items objectAtIndex:self.indexPath.row];

    coverImageURL = [NSURL URLWithString:item.product.image.small];
    [self.photoImageView sd_setImageWithURL:coverImageURL];
    self.nameLabel.text = item.product.name;
    self.amountLabel.text = [NSString stringWithFormat:@"数量：%d",
                             item.quantity];
    self.colorLabel.text = [NSString stringWithFormat:@"价格：%.2f",
                            item.totalPrice.floatValue];
}
@end
