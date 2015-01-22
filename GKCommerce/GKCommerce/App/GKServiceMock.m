//
//  ServiceMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKServiceMock.h"

@implementation GKServiceMock

- (NSDictionary *)loadJSON:(NSString *)jsonName
{
  NSData *data;
  NSString *path;
  NSError *error;
  
  path = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
  data = [NSData dataWithContentsOfFile:path];
  NSDictionary *JSON = [NSJSONSerialization
                        JSONObjectWithData:data
                        options:NSJSONReadingMutableContainers
                        error:&error];
  return JSON;
}
@end
