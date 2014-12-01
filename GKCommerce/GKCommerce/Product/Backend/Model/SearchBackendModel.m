//
//  SearchBackendModel.m
//  WKCommerce
//
//  Created by 小悟空 on 14/10/26.
//  Copyright (c) 2014年 WKCommerce. All rights reserved.
//

#import "SearchBackendModel.h"

@implementation SearchBackendModel

- (id)init
{
    self = [super init];
    if (self) {
        self.perPage = 10;
        self.page = 1;
    }
    return self;
}

- (BOOL)hasMore
{
    return self.page < (self.total / self.perPage);
}

- (SearchBackendModel *)clone
{
    SearchBackendModel *search = [[SearchBackendModel alloc] init];
    search.keywords = self.keywords;
    search.productCategoryID = self.productCategoryID;
    search.sort = self.sort;
    search.page = self.page;
    search.perPage = self.perPage;
    search.total = self.total;
    
    return search;
}
@end
