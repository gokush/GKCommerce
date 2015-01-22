//
//  GKProductAssemblerTest.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "Dependency.h"
#import "GKProductBackendAssembler.h"
#import "GKProductServiceMock.h"
#import "GKServiceMock.h"

SpecBegin(GKProductAssembler)

describe(@"GKProductAssemblerTest", ^{
  it(@"category", ^AsyncBlock{
    
    GKServiceMock *service = [[GKServiceMock alloc] init];
    NSArray *categoriesJSON = (NSArray *)
      [service loadJSON:@"ProductCategories"];
    GKProductBackendAssembler *assembler;
    assembler = [[GKProductBackendAssembler alloc] init];
    NSArray *categories = [assembler productCategories:categoriesJSON];
  });
});
SpecEnd