//
//  CartEmptyView.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-2.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CartEmptyViewDelegate <NSObject>

- (void)shoppingDidTap;
- (void)loginDidTap;

@end

@interface CartEmptyView : UIView

@property (strong, nonatomic) id<CartEmptyViewDelegate> delegate;
@property (assign, nonatomic) BOOL hasLogin;
@property (strong, nonatomic) NSString *buttonString;

@end
