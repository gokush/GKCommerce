//
//  UserBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@class UserBackend;
@protocol UserBackendDelegate <NSObject>

@optional
- (void)userBackend:(UserBackend *)anUserBackend
didCompleteAuthenticate:(User *)anUser error:(NSError *)anError;
@end
