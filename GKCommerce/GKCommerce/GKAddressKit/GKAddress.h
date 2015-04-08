//
//  Address.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKProvince.h"
#import "GKCity.h"
#import "GKCounty.h"
#import "GKTown.h"
#import "GKVillage.h"
#import "GKAddressSynchronization.h"

@interface GKAddress : NSObject

@property (assign, nonatomic) NSInteger userID;
@property (assign, nonatomic) NSInteger addressID;
@property (assign, nonatomic) NSInteger localID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *cellPhone;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) GKProvince *province;
@property (strong, nonatomic) GKCity *city;
@property (strong, nonatomic) GKCounty *county;
@property (strong, nonatomic) GKTown *town;
@property (strong, nonatomic) GKVillage *village;
@property (assign, nonatomic) BOOL isDefault;
/** @property 地址同步到网络上的状态
 */
@property (strong, nonatomic) GKAddressSynchronization *synchronization;
@property (strong, nonatomic) NSDate *createAt;
@property (strong, nonatomic) NSDate *updateAt;

- (GKAddress *)update:(GKAddress *)newObject;
- (GKAddress *)clone;
@end
