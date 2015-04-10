//
//  GKOrderService.h
//  GKCommerce
//
//  Created by 小悟空 on 3/11/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKOrderBackend.h"

@protocol GKOrderService <NSObject>

@property (strong, nonatomic) id<GKOrderBackend> backend;
- (RACSignal *)orders:(GKUser *)user;
@end
