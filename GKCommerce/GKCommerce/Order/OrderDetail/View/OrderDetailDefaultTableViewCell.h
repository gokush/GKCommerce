//
//  MineOrderDetailInfoCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-20.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailTableViewCell.h"

@interface OrderDetailDefaultTableViewCell : OrderDetailTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
