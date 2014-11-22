//
//  ProductDetailViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"
#import "ProductService.h"

typedef enum {
    ProductDetailCarouselSection,
    ProductDetailTitleSection,
    ProductDetailInfomationSection
} ProductDetailSection;

@interface ProductDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, ProductServiceDelegate>

@property (nonatomic, assign) NSInteger productID;
@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) User *user;
@property (nonatomic, retain) ProductService *service;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *buy;
@property (nonatomic, strong) IBOutlet UIButton *addToCart;

- (id)initWithProductID:(NSInteger)productID user:(User *)user;

- (IBAction)didProductInfomationTap:(id)sender;
- (IBAction)didNavigationBackTap:(id)sender;
- (IBAction)addProductToCart:(id)sender;
- (IBAction)gotoCheckout:(id)sender;
- (IBAction)startButtonClick:(id)sender;
- (IBAction)cartDidTap:(id)sender;
@end
