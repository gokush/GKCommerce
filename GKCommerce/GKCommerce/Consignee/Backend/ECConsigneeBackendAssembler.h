//
//  ECConsigneeBackendAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Consignee.h"
#import "ECBackendAssembler.h"

@interface ECConsigneeBackendAssembler : ECBackendAssembler

- (Consignee *)consignee:(NSDictionary *)consigneeJSON;
@end
