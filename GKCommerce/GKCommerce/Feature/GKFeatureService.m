//
//  GKFeatureService.m
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "GKFeatureService.h"

@implementation GKFeatureService

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[Dependency shared] featureBackend];
        self.backend.delegate = self;
    }
    return self;
}

- (void)feature;
{
    [self.backend requestFeature];
}

- (void)featureBackend:(id<FeatureBackend>)aFeatureBackend
     didReceiveFeature:(FeatureViewModel *)feature
{
    SEL selector = @selector(featureService:feature:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate featureService:self feature:feature];
}
@end
