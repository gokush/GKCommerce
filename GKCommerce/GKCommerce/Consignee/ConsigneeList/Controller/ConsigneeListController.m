//
//  ConsigneeListController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ConsigneeListController.h"
#import "ConsigneeListTableViewCell.h"

@interface ConsigneeListController ()

@end

@implementation ConsigneeListController

- (id)initWithConsignees:(NSArray *)consignees
{
    self = [super initWithNibName:@"ConsigneeListView" bundle:nil];
    self.consignees = consignees;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSString *identifier in @[@"ConsigneeListTableViewCell"])
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.consignees.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 89.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsigneeListTableViewCell *cell;
    Consignee *consignee;
    cell = [tableView
            dequeueReusableCellWithIdentifier:@"ConsigneeListTableViewCell"];
    consignee = [self.consignees objectAtIndex:indexPath.row];
    cell.consignee = consignee;
    
    return cell;
}

+ (instancetype)consigneeListControllerWithMock
{
    Consignee *consignee = [[Consignee alloc] init];
    consignee.name = @"小悟空";
    consignee.cellPhone = @"15202171763";
    consignee.postcode = @"900032";
    consignee.address = @"上海市浦东新区张杨北路 距离市中心约15500米";
    
    Area *provice = [[Area alloc] init];
    provice.name = @"上海市";
    
    Area *city = [[Area alloc] init];
    city.name = @"上海市";
    city.parent = provice;
    
    Area *district = [[Area alloc] init];
    district.name = @"虹口区";
    district.parent = city;
    
    consignee.district = district;
    consignee.city = city;
    consignee.province = provice;
    consignee.defaultConsignee = YES;
    
    ConsigneeListController *controller;
    controller = [[ConsigneeListController alloc]
                  initWithConsignees:@[consignee]];
    
    return controller;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
