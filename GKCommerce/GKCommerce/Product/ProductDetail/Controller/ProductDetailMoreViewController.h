//
//  ProductDetailMoreViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-14.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKUser.h"
#import "Product.h"
#import "ProductDetailMoreTab.h"
#import "GKProductService.h"

@interface ProductDetailMoreViewController : UIViewController
<ProductDetailMoreTabDelegate, ProductServiceDelegate,
UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) GKUser *user;
@property (nonatomic, strong) id<GKProductService> service;
@property (nonatomic, strong) IBOutlet ProductDetailMoreTab *tab;
@property (nonatomic, strong) IBOutlet UIView *container;
@property (nonatomic, strong) IBOutlet UIView *bottomBar;

- (id)initWithProduct:(Product *)product user:(User *)anUser;
@end
