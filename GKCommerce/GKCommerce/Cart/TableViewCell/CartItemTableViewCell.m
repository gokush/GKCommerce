//
//  CartItemTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItemTableViewCell.h"
#import "GKLabel.h"
#import "NSString+GKResizable.h"
#import <UIImage+Resize.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation CartItemTableViewCell

- (void)bind
{
}

- (void)unbind
{
}

- (void)updateQuantity
{
  self.quantity.text = [NSString stringWithFormat:@"%d", self.item.quantity];
}

- (void)updateSelected
{
  if (self.select.on != self.item.selected)
    self.select.on = self.item.selected;
}

- (void)updateTotalLabel
{
  self.totalLabel.text = [NSString stringWithFormat:@"%.2f",
                          self.item.totalPrice.floatValue];

}

- (void)render
{
    self.name.text = self.item.product.name;
    self.price.text = [NSString stringWithFormat:@"￥%@",
                       self.item.product.listingPrice];
  
  [self updateQuantity];
  
    self.marketPrice.text = [NSString stringWithFormat:@"￥%@",
                             self.item.product.regularPrice];
    [self.marketPrice setStrikethrough];
    self.select.on = self.item.selected;
    self.amountLabel.text = [NSString stringWithFormat:@"共%d件商品",
                             self.item.quantity];

    self.totalLabel.text = [NSString stringWithFormat:@"￥%@",
                            self.item.totalPrice];
  
  @weakify(self);
  [[[[[[self.item.product.pictures firstObject]
   GKRSetWidth:50.0f] height:50.0f] signal]
    deliverOn:[RACScheduler mainThreadScheduler]]
   subscribeNext:^(UIImage *image) {
    @strongify(self);
    [self.photo setImage:image forState:UIControlStateNormal];
  }];
}

- (IBAction)didTapPhoto:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(cartItem:didTapPhoto:)]) {
        [self.delegate cartItem:self.item didTapPhoto:self.photo];
    }
}

- (void)toggleButton:(GKToggleButton *)aToggleButton didSwitch:(BOOL)onOrOff
{
    self.item.selected = self.select.on;

    SEL selector = @selector(cartItemTableViewCell:didSelect:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate cartItemTableViewCell:self didSelect:self.item.selected];
    }
}

- (IBAction)didTapIncrease:(id)sender;
{
    if ([self.delegate respondsToSelector:@selector(didCartItemBuy:)]) {
        [self.delegate didCartItemBuy:self.item];
    }
}

- (IBAction)didTapDecrease:(id)sender;
{
    if ([self.delegate respondsToSelector:@selector(didCartItemDrop:)]) {
        [self.delegate didCartItemDrop:self.item];
    }
}

- (void)awakeFromNib
{
    UIView *parent = (UIView *)self.quantity.superview;
    parent.layer.borderWidth = 1.0f;
    parent.layer.borderColor = UIColorFromRGB(0xdddddd).CGColor;
    parent.layer.cornerRadius = 4.0f;
    parent.layer.masksToBounds = YES;
    
    self.quantity.borderStyle = UITextBorderStyleNone;
    

  
  @weakify(self);
  [RACObserve(self, item) subscribeNext:^(CartItem *item) {
    @strongify(self);
    [self render];
  }];
  
  [RACObserve(self.item, quantity) subscribeNext:^(id x) {
    @strongify(self);
    [self updateQuantity];
  }];
  
  [RACObserve(self.item, selected) subscribeNext:^(id x) {
    @strongify(self);
    [self updateSelected];
  }];
  
  [RACObserve(self.item, totalPrice) subscribeNext:^(id x) {
    @strongify(self);
    [self updateTotalLabel];
  }];
}
@end
