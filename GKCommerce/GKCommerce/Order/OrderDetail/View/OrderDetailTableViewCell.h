//
//  OrderDetailTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-21.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "GKUser.h"

@interface OrderDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) Order *order;
@property (strong, nonatomic) GKUser *user;
@property (strong, nonatomic) NSIndexPath *indexPath;

- (void)fillData;
@end
