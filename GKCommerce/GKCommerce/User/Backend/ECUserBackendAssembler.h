//
//  ECUserBackendAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "ECBackendAssembler.h"

@interface ECUserBackendAssembler : ECBackendAssembler

- (User *)user:(NSDictionary *)JSON;
@end
