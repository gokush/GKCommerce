//
//  GKUserService.h
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol GKUserService <NSObject>

- (User *)restore;
- (RACSignal *)authenticate:(UserAuthenticationModel *)model;
@end
