//
//  ProductDetailMoreTab.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-14.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailMoreTabButtonDelegate.h"
#import "ProductDetailMoreTabButton.h"

@class ProductDetailMoreTab;

@protocol ProductDetailMoreTabDelegate <NSObject>

@optional
- (void) productDetailMoreTab:(ProductDetailMoreTab *)tab
                 didSelectTap:(NSString *)tabTitle atIndex:(NSInteger)index;

@end

@interface ProductDetailMoreTab : UIView <ProductDetailMoreTabButtonDelegate>

@property (nonatomic, strong) id<ProductDetailMoreTabDelegate> delegate;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSArray *titles;
@end
