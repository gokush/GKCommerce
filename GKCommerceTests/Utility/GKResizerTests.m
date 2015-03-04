//
//  GKResizerTests.m
//  GKCommerce
//
//  Created by 小悟空 on 3/3/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface GKResizerTests : XCTestCase

@end

@implementation GKResizerTests

- (void)testPlaceHold
{
    NSString *placehold1, *placehold2, *placehold3;
    placehold1 = @"http://placehold/320x120&GKResizer/ffffff/000000";
    placehold2 = @"http://placehold/320x320/ffffff/000000";
    placehold3 = @"http://placehold/320/ffffff/000000";
    GKResizer *resizer;
    resizer = [[GKResizer alloc] initWithString:placehold1];
    
    XCTAssertEqual(320.0f, resizer.width);
    XCTAssertEqual(120.0f, resizer.height);
    XCTAssertEqual(YES, [@"GKResizer" isEqualToString: resizer.text]);

    resizer = [[GKResizer alloc] initWithString:placehold2];
    
    XCTAssertEqual(320.0f, resizer.width);
    XCTAssertEqual(320.0f, resizer.height);
    XCTAssertEqual(YES, [@"320 x 320" isEqualToString: resizer.text]);
    
    resizer = [[GKResizer alloc] initWithString:placehold3];
    
    XCTAssertEqual(320.0f, resizer.width);
    XCTAssertEqual(320.0f, resizer.height);
    XCTAssertEqual(YES, [@"320 x 320" isEqualToString: resizer.text]);
}

@end
