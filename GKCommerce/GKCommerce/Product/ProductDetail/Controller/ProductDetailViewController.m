//
//  ProductDetailViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductDetailMoreViewController.h"
#import "ProductDetailCarouselTableViewCell.h"
#import "ProductDetailTitleTableViewCell.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "GKProductServiceMock.h"

@interface ProductDetailViewController ()
{
    NSArray *identifiersOfSection;
}
@end

@implementation ProductDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"this construct method did deprecate.");
    }
    return self;
}

- (id)initWithProductID:(NSInteger)productID user:(GKUser *)user
{
    self = [self initWithNibName:@"ProductDetailView" bundle:nil];
    if (self) {
        self.productID = productID;
        self.user = user;
        [self setup];
    }
    return self;
}

- (void)dealloc
{
}

- (void)setup
{
    identifiersOfSection = @[
        @"ProductDetailCarouselTableViewCell",
        @"ProductDetailTitleTableViewCell",
        @"ProductDetailInfomationTableViewCell"
    ];
    self.cart = self.user.cart;
    self.service = [[GKProductServiceMock alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    for (NSString *identifier in identifiersOfSection)
        [self.tableView registerNib:[UINib nibWithNibName:identifier
                                                   bundle:[NSBundle mainBundle]]
             forCellReuseIdentifier:identifier];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.title = @"产品";

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[self.service productWithID:self.productID
                            user:self.user] subscribeNext:^(Product *product) {
        self.product = product;
        [self.tableView reloadData];
    } error:^(NSError *error) {
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.labelText = [error localizedDescription];
        hud.mode = MBProgressHUDModeCustomView;
        [self.view addSubview:hud];
        [hud show:YES];
        [hud hide:YES afterDelay:2];
    }];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductDetailTableViewCell *cell;
    NSString *identifier;
    identifier = [identifiersOfSection objectAtIndex:indexPath.section];
    cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    cell.product = self.product;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    switch (indexPath.section) {
        case ProductDetailCarouselSection:
            height = 320.0f;
            break;
        case ProductDetailTitleSection:
            height = 133.0f;
            break;
        case ProductDetailInfomationSection:
            height = 44.0f;
            break;
        default:
            break;
    }
    
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case ProductDetailInfomationSection: {
            ProductDetailMoreViewController *moreViewController;
            moreViewController = [[ProductDetailMoreViewController alloc]
                                  initWithProduct:self.product user:self.user];
            
            [self.navigationController pushViewController:moreViewController
                                                 animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark - ProductServiceDelegate
//- (void)productService:(id<ProductService>)aProductService
//               product:(Product *)aProduct error:(NSError *)anError
//{
//    self.product = aProduct;
//    
//    if (anError) {
//        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
//        hud.labelText = [anError localizedDescription];
//        hud.mode = MBProgressHUDModeCustomView;
//        [self.view addSubview:hud];
//        [hud show:YES];
//        [hud hide:YES afterDelay:2];
//    } else
//        [self.tableView reloadData];
//}

- (IBAction)didTapAddProductToCart:(id)sender
{
  if (![[[App shared] currentUser] authorized]) {
    [self.view showHUD:@"请先登录" afterDelay:3];
    return;
  }
  
  CartItemList *list = [[CartItemList alloc] init];
  list.cart = self.user.cart;
  CartItem *item = [[CartItem alloc] initWithList:list];
  item.product = self.product;
  item.quantity = 1;
  
  Cart *cart = [[[App shared] currentUser] cart];
  
  [[self.cartService addItemWithProduct:self.product cart:cart]
   subscribeNext:^(CartItem *item) {
     [self.view showHUD:@"成功加入购物车" afterDelay:1.0f];
   }];
}

- (IBAction)didTapBuy:(id)sender
{
    
}

- (IBAction)didTapProductInfomation:(id)sender
{
    ProductDetailMoreViewController *controller;
    controller = [[ProductDetailMoreViewController alloc]
                  initWithProduct:self.product user:self.user];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)didTapNavigationBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
