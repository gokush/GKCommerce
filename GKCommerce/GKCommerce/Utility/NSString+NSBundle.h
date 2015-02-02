//
//  NSString+NSBundle.h
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSBundle)

- (BOOL)isBundlePath;
- (NSURL *)urlForBundle;
- (NSString *)pathForBundle;
- (NSString *)md5;
@end
