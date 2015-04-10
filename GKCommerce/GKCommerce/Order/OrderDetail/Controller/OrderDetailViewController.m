//
//  MineOrderDetailViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-20.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderDetailDefaultTableViewCell.h"
#import "OrderDetailProductTableViewCell.h"
#import "ProductDetailViewController.h"


#define InfoCellIdentifier   @"MineOrderDetailInfoCell"
#define GoodCellIdentifier   @"MineOrderDetailGoodCell"

typedef enum {
    OrderDetailInfomationSection,
    OrderDetailProductSection
} OrderDetailSection;

@interface OrderDetailViewController ()
{
    NSArray *reuseIdentifiers;
}
@end

@implementation OrderDetailViewController

- (void)dealloc
{
}

- (id)initWithOrderID:(NSInteger)orderID andUser:(GKUser *)user
{
    self = [self init];
    if (self) {
        reuseIdentifiers = @[@"OrderDetailDefaultTableViewCell",
                             @"OrderDetailProductTableViewCell"];
        
        self.orderID = orderID;
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    
    
    CGRect tableFrame = CGRectMake(0, 0, self.view.frame.size.width,
                                   self.view.frame.size.height);
    self.tableView = [[UITableView alloc]
                      initWithFrame:tableFrame
                      style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 17, 0);
    
    for (NSString *reuseIdentifier in reuseIdentifiers) {
        [self.tableView
         registerNib:[UINib nibWithNibName:reuseIdentifier
                                    bundle:nil]
         forCellReuseIdentifier:reuseIdentifier];
    }

    [self.view addSubview:self.tableView];
}

#pragma mark - Table view delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case OrderDetailInfomationSection:
            number = 8;
            break;
        case OrderDetailProductSection:
            number = self.order.items.count;
            break;
        default:
            number = 0;
            break;
    }
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = [reuseIdentifiers
                                 objectAtIndex:indexPath.section];
    OrderDetailTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.order = self.order;
    cell.user = self.user;
    cell.indexPath = indexPath;
    [cell fillData];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height = 0;
    switch (indexPath.section) {
        case OrderDetailInfomationSection:
            height = 43;
            break;
        case OrderDetailProductSection:
            height = 90;
            break;
        default:
            height = 32;
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 17.0f;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == OrderDetailProductSection) {
        CartItem *item = (CartItem *)
            [self.order.items objectAtIndex:indexPath.row];
        Product *product = item.product;
        
        ProductDetailViewController *productDetailViewController;
        productDetailViewController = [[ProductDetailViewController alloc]
                                       initWithProductID:product.productID
                                       user:self.user];
        [self.navigationController
         pushViewController:productDetailViewController animated:YES];
    }
}

#pragma mark- BackendDelegate

- (void)didReceiveOrder:(Order *)order
{
    self.order = order;
    [self.tableView reloadData];
}

@end
