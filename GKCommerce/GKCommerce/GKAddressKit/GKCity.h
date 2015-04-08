//
//  GKCity.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/19/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKRegion.h"

@interface GKCity : GKRegion

@property (assign, nonatomic) NSInteger cityID;
@property (strong, nonatomic) NSArray   *counties;

@end
