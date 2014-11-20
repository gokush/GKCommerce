//
//  UserBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserBackend.h"

@implementation UserBackend

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)requestAuthenticate:(UserAuthenticationModel *)user
{
}

+ (instancetype)shared
{
    static UserBackend *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
