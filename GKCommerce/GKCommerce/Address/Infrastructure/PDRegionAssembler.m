//
//  AreaJSONAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/14.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "PDRegionAssembler.h"

@implementation PDRegionAssembler

- (NSArray *)fromJSON:(NSArray *)areaJSON parent:(Region *)aParent
{
    NSMutableArray *areas = [[NSMutableArray alloc] init];
    for (NSDictionary *item in areaJSON) {
        Region *area = [[Region alloc] init];
        area.areaID = [[item objectForKey:@"id"] integerValue];
        area.name = [item objectForKey:@"name"];
        area.parent = aParent;
        NSString *type = [item objectForKey:@"type"];
        if ([@"province" isEqualToString:type])
            area.type = RegionTypeProvince;
        else if ([@"city" isEqualToString:type])
            area.type = RegionTypeCity;
        else if ([@"district" isEqualToString:type])
            area.type = RegionTypeDistrict;
        
        NSArray *children = [item objectForKey:@"children"];
        if (![children isEqual:[NSNull null]]) {
            area.children = [self fromJSON:children parent:area];
        }
        
        [areas addObject:area];
    }
    
    return areas;
}
@end
