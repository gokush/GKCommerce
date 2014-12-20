//
//  ShippingViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShippingViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *shippings;
@property (weak, nonatomic) NSObject *order;

- (id)initWithShippings:(NSArray *)shippings order:(NSObject *)aOrder;
@end
