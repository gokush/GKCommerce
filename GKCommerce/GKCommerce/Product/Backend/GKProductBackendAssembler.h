//
//  GKProductBackendAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKProductBackendAssembler : NSObject

- (Product *)product:(NSDictionary *)JSON;
@end
