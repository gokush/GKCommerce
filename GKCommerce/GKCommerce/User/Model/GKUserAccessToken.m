//
//  GKUserAccessToken.m
//  GKCommerce
//
//  Created by 小悟空 on 1/20/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserAccessToken.h"

@implementation GKUserAccessToken

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [self init];
  if (self) {
    self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
    self.expires = [[aDecoder decodeObjectForKey:@"expires"] integerValue];
    self.type = [[aDecoder decodeObjectForKey:@"type"] integerValue];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
  [aCoder encodeObject:[NSNumber numberWithInt:self.expires] forKey:@"expires"];
  [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
}

@end
