//
//  ProductDetailMoreTabButton.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-15.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailMoreTabButtonDelegate.h"

@interface ProductDetailMoreTabButton : UILabel

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) id<ProductDetailMoreTabButtonDelegate> delegate;

- (id)initWithTitle:(NSString *)title atIndex:(NSInteger)index;
- (void)showRightBorder;
- (void)active;
- (void)deactive;
@end