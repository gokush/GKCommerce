//
//  MallViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//
#import "ProductCategoryViewController.h"
#import "ProductCategoryTableViewCell.h"
#import "ProductCategoryChildTableViewCell.h"
#import "ProductListViewController.h"

@interface ProductCategoryViewController ()

@end

@implementation ProductCategoryViewController

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.user = [[App shared] currentUser];
    
    self.service = [[Dependency shared] productService];
    self.service.delegate = self;
    [self.service productCategories];
    
    self.navigationItem.title = @"选购";
    [self setupSearchButton];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"输入产品名称、种类搜索";
    self.searchBar.tintColor = [UIColor blackColor];
    
    // setup table view
    UINib *category_nib = [UINib nibWithNibName:@"ProductCategoryTableViewCell"
                                         bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:category_nib
         forCellReuseIdentifier:@"ProductCategoryTableViewCell"];
    [self.tableView setShouldExpandOnlyOneCell:YES];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-34, 0, -30, 0);
    self.tableView.SKSTableViewDelegate = self;
}

- (void)setupSearchButton
{
    UIImageView *searchImageView = [[UIImageView alloc]
                                    initWithImage:[UIImage imageNamed:@""]];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0.0f, 0.0f, 31.0f, 17.0f);
    [searchButton addSubview:searchImageView];
    [searchButton addTarget:self action:@selector(didTapSearchBarButton:)
           forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc]
                                        initWithCustomView:searchButton];
    UIBarButtonItem *holder;
    holder = [[UIBarButtonItem alloc]
              initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
              target:nil action:nil];
    [holder setWidth: -15.0f];
    NSArray *items = [NSArray arrayWithObjects:holder, searchBarButton, nil];
    self.navigationItem.rightBarButtonItems = items;
}

- (void)setupCancleButton
{
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    cancleButton.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    [cancleButton addTarget:self action:@selector(didTapCancleButton:)
           forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancleBarButton = [[UIBarButtonItem alloc]
                                        initWithCustomView:cancleButton];
    UIBarButtonItem *holder;
    holder = [[UIBarButtonItem alloc]
              initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
              target:nil action:nil];
    [holder setWidth: -15.0f];
    NSArray *items = [NSArray arrayWithObjects:holder, cancleBarButton, nil];
    self.navigationItem.rightBarButtonItems = items;
}

- (void)showCoverView:(BOOL)show
{
    if (self.coverView == nil) {
        self.coverView = [[UIView alloc] initWithFrame:self.view.bounds];
        UITapGestureRecognizer *tapGestureRecognizer;
        tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                initWithTarget:self
                                action:@selector(didTapCoverView:)];
        [self.coverView addGestureRecognizer:tapGestureRecognizer];
        self.coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0
                                                         alpha:0.4];
    }
    if (show)
        [self.view addSubview:self.coverView];
    else
        [self.coverView removeFromSuperview];
}

- (void)didTapSearchBarButton:(id)sender
{
    [self setupCancleButton];
    self.navigationItem.titleView = self.searchBar;
    [self.searchBar becomeFirstResponder];
}

- (void)didTapCancleButton:(id)sender
{
    self.navigationItem.titleView = nil;
    [self setupSearchButton];
    [self showCoverView:NO];
}

- (void)didTapCoverView:(id)sender
{
    self.navigationItem.titleView = nil;
    [self setupSearchButton];
    [self showCoverView:NO];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self showCoverView:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.navigationItem.titleView = nil;
    [self setupSearchButton];
    [self showCoverView:NO];
    // TODO hide tab bar
    SearchBackendModel *searchModel = [[SearchBackendModel alloc] init];
    searchModel.keywords = self.searchBar.text;
    ProductListViewController *productListViewController;
    productListViewController = [[ProductListViewController alloc] init];
    
    [self.navigationController pushViewController:productListViewController
                                         animated:YES];
}

#pragma mark - UITableViewController delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.categories.count <= 0) {
        return 0;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (nil != self.categories) {
        return [self.categories count];
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForSubRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:_tableView
                   cellForSubRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ProductCategoryTableViewCell";
    ProductCategoryTableViewCell *cell;
    ProductCategory *category;
    category = [self.categories objectAtIndex:indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.productCategory = category;
    UIView *background = [[UIView alloc] init];
    background.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = background;
    cell.expandable = YES;
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
      cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ProductCategoryChildTableViewCell";
    ProductCategoryChildTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ProductCategoryChildTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (!cell.delegate)
        cell.delegate = self;

    ProductCategory *category = [self.categories objectAtIndex:indexPath.row];
    cell.categories = category.children;
    cell.row = indexPath.row;
    return cell;
}

- (void)productCategoryChildTableViewCell:(ProductCategoryChildTableViewCell *)cell
                         didSelectedAtRow:(NSInteger)row
      column:(NSInteger)column
{
    
    ProductCategory *child;
    ProductCategory *productCategory = [self.categories objectAtIndex:row];
    child = [productCategory.children objectAtIndex:column];
    ProductListViewController *viewController;
    viewController = [[ProductListViewController alloc]
                      initWithProductCategory:child user:self.user];
    
    self.navigationController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark - ProductServiceDelegate

- (void)productService:(id<ProductService>)aProductService
            categories:(NSArray *)aCategories error:(NSError *)anError
{
    self.categories = aCategories;
    [self.tableView reloadData];
}

@end
