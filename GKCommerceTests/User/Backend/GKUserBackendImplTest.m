//
//  UserBackendTest.m
//  GKCommerce
//
//  Created by 小悟空 on 1/18/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "Dependency.h"

#import <XCTest/XCTest.h>

SpecBegin(GKUserBackendImpl)

describe(@"GKUserBackendImpl", ^{
  it(@"should do user info", ^{

  });
});
SpecEnd


@interface GKUserBackendImpl : XCTestCase
@end

@implementation GKUserBackendImpl

- (void)testAuthenticate
{
  id<GKUserBackend> backend = [[Dependency shared] userBackend];
  UserAuthenticationModel *authentication;
  authentication = [[UserAuthenticationModel alloc]
                    initWithUsername:@"swagger" password:@"swagger"];
  NSLog(@"here");
  [[backend requestAuthenticate:authentication] subscribeNext:^(User *user) {
    [[backend requestUser:user] subscribeNext:^(User *user) {
      expect(@"swagger").to.equal(@"swagger");
    } error:^(NSError *error) {
      NSLog(@"%@", error.localizedDescription);
    }];
  } error:^(NSError *error) {
    NSLog(@"%@", error.localizedDescription);
  }];
}
@end