//
//  ProductDetailMoreViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-14.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductDetailMoreViewController.h"
#import "ProductMoreTableViewCell.h"
#import "ProductSpecification.h"
#import <QuartzCore/QuartzCore.h>

@interface ProductDetailMoreViewController ()
{
    UIWebView *tab1;
    UITableView *tab2;
    BOOL willGotoCheckout;
}

@end

@implementation ProductDetailMoreViewController
- (void)dealloc
{
}

- (id)initWithProduct:(Product *)product user:(GKUser *)user;
{
    self = [super initWithNibName:@"ProductDetailMoreView" bundle:nil];
    if (self) {
        self.product = product;
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGRect bottomFrame = [[UIScreen mainScreen] bounds];
    bottomFrame.origin.y = bottomFrame.size.height - 55;
    self.bottomBar.frame = bottomFrame;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, 0.0f, 320.0f, 1.0f);
    bottomBorder.backgroundColor = [UIColor colorWithRed:167.0f/255.0f
                                                   green:167.0f/255.0f
                                                    blue:170.0f/255.0f
                                                   alpha:1.0f].CGColor;
    [self.bottomBar.layer addSublayer:bottomBorder];
    
    CGRect containerFrame = [[UIScreen mainScreen] bounds];
    containerFrame.origin.y = 106;
    containerFrame.size.height -= 106;
    self.container.frame = containerFrame;
    
    self.tab.delegate = self;
    CGRect tabFrame = self.tab.frame;
    tabFrame.origin.y = 64;
    self.tab.frame = tabFrame;
    
    CGRect frame = self.container.frame;
    frame.origin.y = 0;
    tab1 = [self.container.subviews lastObject];
    tab2 = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];

    self.title = @"商品详情";
    
    UINib *nib = [UINib nibWithNibName:@"ProductMoreTableViewCell" bundle:nil];
    [tab2 registerNib:nib forCellReuseIdentifier:@"ProductMoreTableViewCell"];
    tab2.backgroundColor = [UIColor colorWithRed:243.0f/255.0f
                                           green:243.0f/255.0f
                                            blue:243.0f/255.0f
                                           alpha:1.0f];
    tab2.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab2.delegate = self;
    tab2.dataSource = self;
    
    [tab1 loadHTMLString:self.product.productDescription baseURL:nil];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46.0f;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger numbers = self.product.specifications.count;
    return numbers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductSpecification *specification;
    ProductMoreTableViewCell *cell;
    specification = (ProductSpecification *)
        [self.product.specifications objectAtIndex:indexPath.row];
    cell = [tab2 dequeueReusableCellWithIdentifier:@"ProductMoreTableViewCell"];
    cell.left.text = specification.name;
    cell.right.text = specification.value.label;
    
    return cell;
}

- (void)didSelectTap:(NSString *)tabTitle atIndex:(NSInteger)index
{
    NSInteger size = self.container.subviews.count;
    while (size > 0) {
        size -= 1;
        [[self.container.subviews objectAtIndex:size] removeFromSuperview];
    }
    
    NSString *propertyName = [NSString stringWithFormat:@"tab%ld", index + 1];
    UIView *target = (UIView *) [self valueForKey:propertyName];
    [self.container addSubview:target];
}
@end
