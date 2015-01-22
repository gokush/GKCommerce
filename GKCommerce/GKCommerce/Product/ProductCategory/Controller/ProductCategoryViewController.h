//
//  MallViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"
#import "ProductCategoryChildTableViewCell.h"

@interface ProductCategoryViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, SKSTableViewDelegate,
UISearchBarDelegate, ProductCategoryChildTableViewCellDelegate,
ProductServiceDelegate>

@property (strong, nonatomic) id<GKProductService> service;
@property (strong, nonatomic) UIBarButtonItem *titleView;
@property (strong, nonatomic) IBOutlet SKSTableView *tableView;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, assign) NSInteger currentRow;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIView *coverView;


@end
