//
//  CartItemOverviewTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"
#import "UIBindableTableViewCell.h"

@interface CartItemOverviewTableViewCell : UITableViewCell
<UIBindableTableViewCell>

@property (nonatomic, strong) IBOutlet UILabel *overview;
@property (nonatomic, strong) IBOutlet UILabel *price;
@property (nonatomic, strong) Cart *cart;
- (void)bind;
- (void)unbind;
@end
