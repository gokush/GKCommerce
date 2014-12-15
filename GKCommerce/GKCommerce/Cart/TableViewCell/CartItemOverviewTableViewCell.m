//
//  CartItemOverviewTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItemOverviewTableViewCell.h"

@implementation CartItemOverviewTableViewCell

- (void)awakeFromNib
{
    @weakify(self);
    [RACObserve(self, list.price) subscribeNext:^(id x) {
        @strongify(self);
        [self render];
    }];
}

- (void)render
{
    if (!self.list)
        return;
    
    NSString *price, *description;
    price = [NSString stringWithFormat:@"%.2f",[self.list wantTotalPrice]];
    
    description = [NSString stringWithFormat:@"共%u件商品 实付:",
                   self.list.items.count];
    self.price.text = price;
    self.overview.text = description;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    [self render];
}

- (void)bind
{

}

- (void)unbind
{
}
@end
