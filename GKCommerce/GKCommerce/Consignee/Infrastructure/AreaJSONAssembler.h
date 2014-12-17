//
//  AreaJSONAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/14.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Region.h"

@interface AreaJSONAssembler : NSObject

- (NSArray *)fromJSON:(NSArray *)areaJSON parent:(Region *)aParent;
@end
