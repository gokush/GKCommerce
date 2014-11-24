//
//  CartItemTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItemTableViewCell.h"
#import "GKLabel.h"
#import <UIImage+Resize.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation CartItemTableViewCell

- (void)bind
{
    [self.item addObserver:self forKeyPath:@"quantity" options:0 context:nil];
    [self.item addObserver:self forKeyPath:@"selected" options:0 context:nil];
    [self.item addObserver:self forKeyPath:@"totalPrice" options:0 context:nil];
    [self addObserver:self forKeyPath:@"item" options:0 context:nil];
}

- (void)unbind
{
    [self.item removeObserver:self forKeyPath:@"quantity"];
    [self.item removeObserver:self forKeyPath:@"selected"];
    [self.item removeObserver:self forKeyPath:@"totalPrice"];
    [self removeObserver:self forKeyPath:@"item"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([@"quantity" isEqualToString:keyPath]) {
        self.quantity.text = [NSString stringWithFormat:@"%d",
                              self.item.quantity];
    }
    if ([@"selected" isEqual:keyPath]) {
        self.select.on = self.item.selected;
    } else if ([@"totalPrice" isEqualToString:keyPath])
        self.totalLabel.text = [NSString stringWithFormat:@"%.2f",
                                self.item.totalPrice.floatValue];
    else if ([@"item" isEqualToString:keyPath])
        [self render];
}

- (void)render
{
    self.name.text = self.item.product.name;
    self.price.text = [NSString stringWithFormat:@"￥%@",
                       self.item.product.price];
    self.quantity.text = [NSString stringWithFormat:@"%d",
                          self.item.quantity];
    self.marketPrice.text = [NSString stringWithFormat:@"￥%@",
                             self.item.product.marketPrice];
    [self.marketPrice setStrikethrough];
    self.select.on = self.item.selected;
    self.amountLabel.text = [NSString stringWithFormat:@"共%d件商品",
                             self.item.quantity];

    self.totalLabel.text = [NSString stringWithFormat:@"￥%@",
                            self.item.totalPrice];
    
    
    NSString *key = [NSString stringWithFormat:@"cart_product_50x50_%d",
                     self.item.product.productID];
    SDImageCache *cache = [[SDImageCache alloc]
                           initWithNamespace:@"MyNameSpace"];
    [cache queryDiskCacheForKey:key done:^(UIImage *image,
                                           SDImageCacheType cacheType) {
        [self cache:cache photo:image forKey:key];
    }];
}

- (void)cache:(SDImageCache *)cache photo:(UIImage *)aPhoto
       forKey:(NSString *)key
{
    if (aPhoto) {
        [self.photo setImage:aPhoto forState:UIControlStateNormal];
        return;
    }
    NSURL *photoURL;
    photoURL = [NSURL URLWithString:self.item.product.image.thumbnail];
    
    [[SDWebImageDownloader sharedDownloader]
     
     downloadImageWithURL:photoURL options:0
     progress:^(NSInteger receivedSize, NSInteger expectedSize) {
     }
     completed:^(UIImage *image, NSData *data, NSError *error,
                 BOOL finished) {

         [self cache:cache photo:aPhoto forKey:key didDownloadImage:image
               error:error];
     }];
}

- (void)cache:(SDImageCache *)cache photo:(UIImage *)aPhoto
       forKey:(NSString *)key didDownloadImage:(UIImage *)image
        error:(NSError *)anError
{
    if (image) {
        image = [image resizedImageToSize:CGSizeMake(50.0f, 50.0f)];
        [self.photo setImage:image forState:UIControlStateNormal];
        [cache storeImage:image forKey:key toDisk:YES];
    }
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

- (IBAction)increase:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didCartItemBuy:)]) {
        [self.delegate didCartItemBuy:self.item];
    }
}

- (IBAction)decrease:(id)sender
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
}
@end
