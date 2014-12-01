//
//  FeatureService.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureServiceDelegate.h"

@protocol FeatureService <NSObject>

@property (strong, nonatomic) id<FeatureServiceDelegate> delegate;

- (void)feature;
@end
