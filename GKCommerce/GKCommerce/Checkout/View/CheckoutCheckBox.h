//
//  CheckoutCheckBox.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-24.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CheckoutCheckBox;
@protocol CheckoutCheckBoxDelegate <NSObject>
@optional
- (void)checkoutCheckBox:(CheckoutCheckBox *)checkBox didChecked:(BOOL)checked;
@end

@interface CheckoutCheckBox : UIView
{
    UIImageView *selectedImageView;
}

@property (assign, nonatomic) BOOL selected;
@property (strong, nonatomic) id<CheckoutCheckBoxDelegate> delegate;

@end
