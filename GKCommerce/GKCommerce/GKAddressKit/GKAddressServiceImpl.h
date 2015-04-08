//
//  GKAdressServiceImpl.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAddressService.h"
#import "GKRegionBackend.h"
#import "GKAddressBackend.h"
#import "GKAddressKitExample-swift.h"

@interface GKAddressServiceImpl : NSObject <GKAddressService>

@property (strong, nonatomic) id<GKRegionBackend> regionBackend;
@property (strong, nonatomic) id<GKAddressBackend> backend;
@property (strong, nonatomic) id<GKAddressRepository> repository;
@property (strong, nonatomic) PersistenStack *persistenStack;

- (id)initWithRegionBackend:(id<GKRegionBackend>)regionBackend;
- (RACSignal *)provinces;
- (RACSignal *)citiesWithProvinceID:(NSInteger)provinceID;
- (RACSignal *)countiesWithCityID:(NSInteger)cityID;
- (RACSignal *)townsWithCountyID:(NSInteger)countyID;
- (RACSignal *)villagesWithTownID:(NSInteger)TownID;
- (RACSignal *)addressesWithUser:(GKUser *)user;
- (RACSignal *)create:(GKAddress *)address;
@end
