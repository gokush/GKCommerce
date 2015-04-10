//
//  GKProductBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GKProductBackend <NSObject>

- (RACSignal *)requestProductWithID:(NSInteger)productID user:(GKUser *)anUser;
@end
