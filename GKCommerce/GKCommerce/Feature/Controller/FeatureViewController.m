//
//  DefaultViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "FeatureViewController.h"
#import "ProductDetailViewController.h"
#import "ProductListViewController.h"
#import "FeatureCarouselTableViewCell.h"
#import "FeatureOneColumnTableViewCell.h"
#import "FeatureThreeColumnTableViewCell.h"

@interface FeatureViewController ()
{
    NSArray *identifiersOfSection;
}
@end

@implementation FeatureViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return  self;
}

- (void)dealloc
{
}

- (void)setup
{
    identifiersOfSection = @[@"FeatureCarouselTableViewCell",
                             @"FeatureThreeColumnTableViewCell",
                             @"FeatureOneColumnTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#import "ProductListViewController.h"

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSString *identifier in identifiersOfSection) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier
                                                   bundle:[NSBundle mainBundle]]
             forCellReuseIdentifier:identifier];
    }
    
    self.title = @"精选";
    self.service = [[Dependency shared] featureService];
    self.service.delegate = self;
    [self.service feature];
}

#pragma mark - UITableView's delegates
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    switch (indexPath.section) {
        case FeatureCarouselSection:
            height = 140.0f;
            break;
        case FeatureThreeColumnSection:
            height = 161.0f;
            break;
        case FeatureOneColumnSection:
            height = 182.0f;
            break;
        default:
            break;
    }
    return height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.model.cells && self.model.cells.count > 0)
        return self.model.cells.count;
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    if (0 == section)
        return 0.0f;
    return 10.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeatureTableViewCell *cell;
    NSString *reuseIdentifier = identifiersOfSection[indexPath.section];
    cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.delegate = self;
    switch (indexPath.section) {
        case FeatureCarouselSection: {
            FeatureCarouselTableViewCell *carouselCell;
            carouselCell = (FeatureCarouselTableViewCell *)cell;
            carouselCell.carousels =
                [self.model.cells objectAtIndex:indexPath.section];
            
            break;
        }
        case FeatureOneColumnSection: {
            FeatureOneColumnTableViewCell *oneColumn;
            oneColumn = (FeatureOneColumnTableViewCell *)cell;
            oneColumn.model = (FeatureOneColumnModel *)
                [self.model.cells objectAtIndex:indexPath.section];
            break;
        }
        case FeatureThreeColumnSection: {
            FeatureThreeColumnTableViewCell *threeColumn;
            threeColumn = (FeatureThreeColumnTableViewCell *)cell;
            threeColumn.model =
                [self.model.cells objectAtIndex:indexPath.section];
            break;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // DEMO
    ProductDetailViewController *viewController;
    viewController = [[ProductDetailViewController alloc]
                      initWithProductID:1 user:nil];
    [viewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:viewController animated:YES];
    
    switch (indexPath.section) {
        case FeatureThreeColumnSection: {
            break;
        }
        default:
            break;
    }
}

#pragma mark - FeatureTableViewCellDelegate
- (void)featureTableViewCell:(FeatureTableViewCell *)featureTableViewCell
            didSelectProduct:(Product *)product
{
#ifdef DEMO
//    ProductDetailViewController *viewController;
//    viewController = [[ProductDetailViewController alloc]
//                      initWithProductID:32 user:[[Shop currentShop] currentUser]];
//    viewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController
//     pushViewController:viewController animated:YES];
#endif
}

#pragma mark - FeatureServiceDelegate

- (void)featureService:(id<FeatureService>)service
               feature:(FeatureViewModel *)aFeature
{
    self.model = aFeature;
    [self.tableView reloadData];
}
@end
