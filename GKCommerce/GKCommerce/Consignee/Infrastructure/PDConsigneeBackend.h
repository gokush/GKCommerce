//
//  ConsigneeBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Consignee.h"
#import "AreaJSONAssembler.h"

@class PDConsigneeBackend;

@protocol PDConsigneeBackendDelegate <NSObject>

@optional
- (void)consigneeBackend:(PDConsigneeBackend *)aConsigneeBackend
         didReceiveAreas:(NSArray *)areas;
@end


@interface PDConsigneeBackend : NSObject

@property (strong, nonatomic) id<PDConsigneeBackendDelegate> delegate;
@property (strong, nonatomic) AreaJSONAssembler *areaJSONAssembler;
- (void)requestAreas;
@end
