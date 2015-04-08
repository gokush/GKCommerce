//
//  GKAddressService.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/20/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUser.h"
#import "GKAddressBackend.h"
#import "GKAddressRepository.h"

@protocol GKAddressService <NSObject>

@property (strong, nonatomic) id<GKAddressBackend> backend;
@property (strong, nonatomic) id<GKAddressRepository> repository;

- (RACSignal *)provinces;
- (RACSignal *)citiesWithProvinceID:(NSInteger)provinceID;
- (RACSignal *)countiesWithCityID:(NSInteger)cityID;
- (RACSignal *)townsWithCountyID:(NSInteger)countyID;
- (RACSignal *)villagesWithTownID:(NSInteger)TownID;
- (RACSignal *)addressesWithUser:(GKUser *)user;
- (RACSignal *)addressWithID:(NSInteger)addressID user:(GKUser *)anUser;
- (RACSignal *)create:(GKAddress *)address;
@end
