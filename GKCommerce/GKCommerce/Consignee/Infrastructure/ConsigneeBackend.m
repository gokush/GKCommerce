//
//  ConsigneeBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ConsigneeBackend.h"
#import <AFNetworking/AFNetworking.h>

@implementation ConsigneeBackend
{
    AFHTTPRequestOperationManager *manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.areaJSONAssembler = [[AreaJSONAssembler alloc] init];
        manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes =
            [NSSet setWithObject:@"text/html"];
    }
    return self;
}

- (void)requestAreas
{
    NSDictionary *parameters;
    parameters = @{ @"tree": @"1" };
    [manager
     GET:@"http://publicdata.duapp.com/area" parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestAreasDidResponse:responseObject];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
}

- (void)requestAreasDidResponse:(id)responseObject
{
    NSArray *areas = [self.areaJSONAssembler fromJSON:responseObject];
    if ([self.delegate respondsToSelector:
         @selector(consigneeBackend:didReceiveAreas:)]) {
        [self.delegate consigneeBackend:self didReceiveAreas:areas];
    }
}
@end
