//
//  AreaJSONAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/14.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Area.h"

@interface AreaJSONAssembler : NSObject

- (NSArray *)fromJSON:(NSArray *)areaJSON;
@end
