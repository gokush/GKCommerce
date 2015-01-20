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
        self.config = [GKConfig shared];
        self.manager = [AFHTTPRequestOperationManager manager];
      [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"accept"];
    }
    return self;
}

@end
