//
//  FeatureModelFactory.m
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "FeatureModelFactory.h"
#import "FeatureOneColumnModel.h"
#import "FeatureThreeColumnModel.h"

@implementation FeatureModelFactory

- (NSURL *)URLForResource:(NSString *)resourceName
{
    NSString *extension = [resourceName pathExtension];
    NSString *path = [resourceName stringByDeletingPathExtension];
    return [[NSBundle mainBundle] URLForResource:path withExtension:extension];
}

- (FeatureViewModel *)featureModelWithJSON:(NSDictionary *)JSON
{
    FeatureViewModel *featureViewModel = [[FeatureViewModel alloc] init];
    
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    NSArray *cellsJSON = [JSON objectForKey:@"cells"];
    NSString *type;
    if (cellsJSON) {
        for (NSDictionary *cellJSON in cellsJSON) {
            type = [cellJSON objectForKey:@"type"];
            if ([@"FeatureOneColumn" isEqualToString:type])
                [cells addObject:
                 [self createFeatureOneColumnModelWithJSON:cellJSON]];
            if ([@"FeatureThreeColumn" isEqualToString:type])
                [cells addObject:
                 [self createFeatureThreeColumnModelWithJSON:cellJSON]];
            if ([@"FeatureCarouselTableViewCell" isEqualToString:type])
                [cells addObject:
                 [self createFeatureCarouselsWithJSON:cellJSON]];
        }
    }
    featureViewModel.cells = cells;
    return featureViewModel;
}

- (NSArray *)createFeatureCarouselsWithJSON:(NSDictionary *)carouselsJSON
{
    NSMutableArray *carousels = [[NSMutableArray alloc] init];
    FeatureCarouselModel *carousel;
    
    for (NSDictionary *carouselJSON in
         [carouselsJSON objectForKey:@"carousels"]) {
        carousel = [[FeatureCarouselModel alloc] init];
        NSObject *pictureJSON = [carouselJSON objectForKey:@"picture"];
        if (pictureJSON)
            carousel.picture = [self pictureURLWithJSON:pictureJSON];
        [carousels addObject:carousel];
    }
    
    return carousels;
}

- (NSURL *)pictureURLWithJSON:(NSObject *)JSON
{
    NSURL *url;
    NSDictionary *pictureJSON = (NSDictionary *)JSON;
    if ([JSON isKindOfClass:[NSString class]])
        return [NSURL URLWithString:(NSString *)JSON];
    
    NSString *protocol = [pictureJSON objectForKey:@"protocol"];
    if (protocol && [@"file" isEqualToString:protocol])
        url = [self URLForResource:[pictureJSON objectForKey:@"path"]];
    else if ([JSON isKindOfClass:[NSDictionary class]])
        url = [NSURL URLWithString:[pictureJSON objectForKey:@"path"]];
    return url;
}

- (FeatureOneColumnModel *)createFeatureOneColumnModelWithJSON:
(NSDictionary *)JSON
{
    FeatureOneColumnModel *oneColumnModel;
    NSDictionary *pictureJSON;
    oneColumnModel = [[FeatureOneColumnModel alloc] init];
    oneColumnModel.type = FeatureOneColumn;
    
    pictureJSON = [JSON objectForKey:@"picture"];
    if (pictureJSON) {
        oneColumnModel.picture = [self pictureURLWithJSON:pictureJSON];
    }
    oneColumnModel.link = [[NSURL alloc]
                           initWithString:[JSON objectForKey:@"link"]];
    oneColumnModel.title = [JSON objectForKey:@"title"];
    return oneColumnModel;
}

- (FeatureThreeColumnModel *)createFeatureThreeColumnModelWithJSON:
(NSDictionary *)JSON
{
    FeatureThreeColumnModel *model = [[FeatureThreeColumnModel alloc] init];
    model.title = [JSON objectForKey:@"title"];
    NSMutableArray *columns = [[NSMutableArray alloc] init];
    
    for (NSDictionary *columnJSON in [JSON objectForKey:@"columns"]) {
        FeatureThreeColumnModelItem *itemModel =
            [[FeatureThreeColumnModelItem alloc] init];
        
        itemModel.price = [[NSDecimalNumber alloc]
                           initWithDouble:[[columnJSON objectForKey:@"price"]
                                           doubleValue]];
        itemModel.hightlight = [columnJSON objectForKey:@"highlight"];
        itemModel.picture = [self pictureURLWithJSON:
                             [columnJSON objectForKey:@"picture"]];
        
        [columns addObject:itemModel];
    }
    model.columns = columns;
    
    return model;
}
@end
