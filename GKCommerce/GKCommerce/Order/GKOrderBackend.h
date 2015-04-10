//
//  GKOrderBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 3/11/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GKOrderBackend <NSObject>

- (RACSignal *)requestOrders:(GKUser *)user;
@end
