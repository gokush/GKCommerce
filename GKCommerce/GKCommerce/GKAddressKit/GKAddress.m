//
//  Address.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "GKAddress.h"

@implementation GKAddress

- (GKAddress *)update:(GKAddress *)newObject
{
  self.addressID = newObject.addressID;
  self.name = newObject.name;
  self.cellPhone = newObject.cellPhone;
  self.postcode = newObject.postcode;
  self.address = newObject.address;
  self.province = newObject.province;
  self.city = newObject.city;
  self.county = newObject.county;
  self.town = newObject.town;
  self.village = newObject.village;
  self.isDefault = newObject.isDefault;
  return self;
}

- (GKAddress *)clone
{
  GKAddress *clone = [[GKAddress alloc] init];
  clone.addressID = self.addressID;
  clone.name = self.name;
  clone.cellPhone = self.cellPhone;
  clone.postcode = self.postcode;
  clone.address = self.address;
  clone.province = self.province;
  clone.city = self.city;
  clone.county = self.county;
  clone.town = self.town;
  clone.village = self.village;
  clone.isDefault = self.isDefault;
  
  return clone;
}
@end
