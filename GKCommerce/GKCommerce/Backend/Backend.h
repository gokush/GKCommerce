//
//  Backend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "GKConfig.h"

@interface Backend : NSObject

@property (strong, nonatomic) GKConfig *config;
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@end
