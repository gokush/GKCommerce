//
//  ProductDetailMoreViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-14.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Product.h"
#import "ProductDetailMoreTab.h"
#import "Backend.h"
#import "ProductService.h"

@interface ProductDetailMoreViewController : UIViewController
<ProductDetailMoreTabDelegate, ProductServiceDelegate,
UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) id<ProductService> service;
@property (nonatomic, strong) IBOutlet ProductDetailMoreTab *tab;
@property (nonatomic, strong) IBOutlet UIView *container;
@property (nonatomic, strong) IBOutlet UIView *bottomBar;

- (id)initWithProduct:(Product *)product user:(User *)anUser;
@end
