//
//  ServiceMock.h
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKServiceMock : NSObject

- (NSDictionary *)loadJSON:(NSString *)jsonName;
@end
