//
//  CartEmptyView.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-2.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKButton.h"

@protocol CartEmptyViewDelegate <NSObject>

- (void)didTapShopping;
- (void)didTapAuthenticate;
@end

@interface CartEmptyView : UIView

@property (strong, nonatomic) id<CartEmptyViewDelegate> delegate;
@property (assign, nonatomic) BOOL authenticated;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet GKButton *actionButton;
- (IBAction)didTapShopping:(id)sender;
@end
