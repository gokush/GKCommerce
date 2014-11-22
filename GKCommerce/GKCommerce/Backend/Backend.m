//
//  Backend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Backend.h"

@implementation Backend

- (id)init
{
    self = [super init];
    if (self) {
        self.config = [Config shared];
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer.acceptableContentTypes =
            [NSSet setWithObject:@"text/html"];
    }
    return self;
}

@end
