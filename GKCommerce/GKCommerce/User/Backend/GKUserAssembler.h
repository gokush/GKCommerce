//
//  GKUserAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface GKUserAssembler : NSObject

- (User *)user:(NSDictionary *)anUser;
@end
