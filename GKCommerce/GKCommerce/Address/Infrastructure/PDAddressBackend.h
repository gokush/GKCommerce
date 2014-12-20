//
//  AddressBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "PDRegionAssembler.h"

@class PDAddressBackend;

@protocol PDAddressBackendDelegate <NSObject>

@optional
- (void)addressBackend:(PDAddressBackend *)anAddressBackend
     didReceiveRegions:(NSArray *)regions;
@end


@interface PDAddressBackend : NSObject

@property (strong, nonatomic) id<PDAddressBackendDelegate> delegate;
@property (strong, nonatomic) PDRegionAssembler *assembler;
- (void)requestRegions;
@end
