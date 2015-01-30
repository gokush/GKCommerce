//
//  GKUserBackendMock.h
//  GKCommerce
//
//  Created by 小悟空 on 1/30/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserBackend.h"
#import "Backend.h"
#import "GKUserAssembler.h"

@interface GKUserBackendMock : NSObject <GKUserBackend>

@property (strong, nonatomic) GKUserAssembler *assembler;
- (RACSignal *)requestAuthenticate:(UserAuthenticationModel *)user;
- (RACSignal *)requestUser:(GKUserAccessToken *)accessToken;
@end
