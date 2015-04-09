//
//  ProductDetailViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

typedef enum {
    ProductDetailCarouselSection,
    ProductDetailTitleSection,
    ProductDetailInfomationSection
} ProductDetailSection;

@interface ProductDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, ProductServiceDelegate>

@property (strong, nonatomic) Cart *cart;
@property (nonatomic, assign) NSInteger productID;
@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) GKUser *user;
@property (nonatomic, retain) id<GKProductService> service;
@property (strong, nonatomic) id<GKCartService> cartService;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *buy;
@property (nonatomic, strong) IBOutlet UIButton *addToCart;

- (id)initWithProductID:(NSInteger)productID user:(User *)user;

- (IBAction)didTapProductInfomation:(id)sender;
- (IBAction)didTapNavigationBack:(id)sender;
- (IBAction)didTapAddProductToCart:(id)sender;
- (IBAction)didTapBuy:(id)sender;
@end
