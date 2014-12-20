//
//  AddressBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "PDAddressBackend.h"
#import <AFNetworking/AFNetworking.h>

@implementation PDAddressBackend
{
    AFHTTPRequestOperationManager *manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[PDRegionAssembler alloc] init];
        manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes =
            [NSSet setWithObject:@"text/html"];
    }
    return self;
}

- (void)requestRegions
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
    NSArray *regions = [self.assembler fromJSON:responseObject
                                               parent:nil];
    SEL selector = @selector(addressBackend:didReceiveRegions:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate addressBackend:self didReceiveRegions:regions];
    }
}
@end
