//
//  CartItemOverviewTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItemOverviewTableViewCell.h"

@implementation CartItemOverviewTableViewCell

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
}

- (void)render
{
    if (!self.cart)
        return;
    
    NSString *price = [NSString stringWithFormat:@"%.2f",
                       self.cart.price.floatValue];
    
    NSString *description = [NSString stringWithFormat:@"共%u件商品 实付:",
                             self.cart.items.count];
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
    [self addObserver:self forKeyPath:@"cart"
              options:NSKeyValueObservingOptionInitial context:nil];
    [self.cart addObserver:self forKeyPath:@"price" options:0 context:nil];
}

- (void)unbind
{
    [self removeObserver:self forKeyPath:@"cart"];
    [self.cart removeObserver:self forKeyPath:@"price"];
}
@end
