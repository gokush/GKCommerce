//
//  ProductListViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-3.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductService.h"
#import "GKSegmentView.h"

@interface ProductListViewController : UIViewController
<ProductServiceDelegate, GKSegmentViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet GKSegmentView *segmentView;
@property (assign, nonatomic) BOOL isLoadingMore;
@property (assign, nonatomic) BOOL isReloading;
@property (strong, nonatomic) ProductCategory *productCategory;
@property (strong, nonatomic) SearchBackendModel *search;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) GKUser *user;
@property (strong, nonatomic) id<GKProductService> service;
- (id)initWithProductCategory:(ProductCategory *)category user:(User *)anUser;
- (id)initWithSearchModel:(SearchBackendModel *)searchModel user:(User *)anUser;
@end
