//
//  ProductDetailMoreTabButtonDelegate.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-15.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProductDetailMoreTabButton;

@protocol ProductDetailMoreTabButtonDelegate <NSObject>
- (void)didTapTabButton:(ProductDetailMoreTabButton *)button;
@end
