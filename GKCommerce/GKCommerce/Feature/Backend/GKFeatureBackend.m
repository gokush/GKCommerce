//
//  GKFeatureBackend.m
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "GKFeatureBackend.h"

@implementation GKFeatureBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[GKFeatureBackendAssembler alloc] init];
    }
    return self;
}

- (void)requestFeature
{
    NSString *featureName = @"Feature.json";
    NSString *extension = [featureName pathExtension];
    NSString *path = [featureName stringByDeletingPathExtension];
    NSData *data;
    NSError *error;
    NSURL *local = [[NSBundle mainBundle] URLForResource:path
                                           withExtension:extension];
    
    data = [NSData dataWithContentsOfURL:local];
    NSDictionary *JSON = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:NSJSONReadingMutableContainers
                          error:&error];
    
    FeatureViewModel *model;
    model = [self.assembler featureModelWithJSON:JSON];
    
    SEL selector = @selector(featureBackend:didReceiveFeature:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate featureBackend:self didReceiveFeature:model];
}
@end
