//
//  GKRegionBackend.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol GKRegionBackend <NSObject>

- (RACSignal *)fetchProvinces;
- (RACSignal *)fetchCitiesWithProvinceID:(NSInteger)provinceID;
- (RACSignal *)fetchCountiesWithCityID:(NSInteger)cityID;
- (RACSignal *)fetchTownsWithCountyID:(NSInteger)countyID;
- (RACSignal *)fetchVillagesWithTownID:(NSInteger)TownID;
@end
