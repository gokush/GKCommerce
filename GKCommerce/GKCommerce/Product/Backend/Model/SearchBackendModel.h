//
//  SearchBackendModel.h
//  WKCommerce
//
//  Created by 魏琮举 on 14/10/26.
//  Copyright (c) 2014年 WKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchBackendModel : NSObject

@property (strong, nonatomic) NSString *keywords;
@property (assign, nonatomic) NSInteger catalogID;
// TODO 用枚举
@property (strong, nonatomic) NSString *sort;
@property (assign, nonatomic) NSInteger page;
@property (assign, nonatomic) NSInteger perPage;
@property (assign, nonatomic) NSInteger total;

- (BOOL)hasMore;
- (SearchBackendModel *)clone;
@end
