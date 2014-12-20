//
//  ShippingViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ShippingViewController.h"

@implementation ShippingViewController

- (id)initWithShippings:(NSArray *)shippings order:(NSObject *)aOrder
{
    self = [self init];
    if (self) {
        self.shippings = shippings;
        self.order = aOrder;
    }
    return self;
}

- (void)viewDidLoad
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.shippings.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [self.tableView
            dequeueReusableCellWithIdentifier:@"ShippingTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:@"ShippingTableViewCell"];
    }
    
    ShippingMethod *shipping = [self.shippings objectAtIndex:indexPath.row];
    cell.textLabel.text = shipping.name;
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"运费:￥%.2f",
                                 shipping.freight.floatValue];
    
    ShippingMethod *orderShipping = [self.order valueForKey:@"shipping"];
    if (orderShipping && shipping.shippingID == orderShipping.shippingID)
        [self.tableView selectRowAtIndexPath:indexPath animated:YES
                              scrollPosition:0];
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShippingMethod *shipping = [self.shippings objectAtIndex:indexPath.row];
    [self.order setValue:shipping forKey:@"shipping"];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
