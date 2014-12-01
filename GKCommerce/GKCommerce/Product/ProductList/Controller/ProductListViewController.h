//
//  ProductListViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-3.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreeStageSegmentView.h"
#import "ProductService.h"

@interface ProductListViewController : UIViewController
<ThreeStageSegmentViewDelegate, ProductServiceDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (assign, nonatomic) BOOL isLoadingMore;
@property (assign, nonatomic) BOOL isReloading;
@property (strong, nonatomic) ProductCategory *productCategory;
@property (strong, nonatomic) SearchBackendModel *search;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) id<ProductService> service;
- (id)initWithProductCategory:(ProductCategory *)category user:(User *)anUser;
@end
