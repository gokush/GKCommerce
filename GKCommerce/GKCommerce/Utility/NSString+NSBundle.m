//
//  NSString+NSBundle.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "NSString+NSBundle.h"

@implementation NSString (NSBundle)

- (BOOL)isBundlePath
{
  NSError *error;
  NSRegularExpression *regular;
  regular = [NSRegularExpression regularExpressionWithPattern:@"^[^#]*?://"
                                                      options:0 error:&error];
  NSRange range = [regular
                   rangeOfFirstMatchInString:self
                   options:0 range:NSMakeRange(0, [self length])];
  
  return (NSNotFound == range.location);
}

- (NSURL *)urlForBundle
{
  if ([self isBundlePath]) {
    NSString *path = [self pathForBundle];
    if (nil == path)
      return nil;
    return [NSURL fileURLWithPath:path];
  }
  
  return [NSURL URLWithString:self];
}

- (NSString *)pathForBundle
{
  NSString *withoutExtension, *extension;
  if ([self isBundlePath]) {
    withoutExtension = [self stringByDeletingPathExtension];
    extension = [self pathExtension];
    return [[NSBundle mainBundle] pathForResource:withoutExtension
                                           ofType:extension];
  }
  
  return self;
}
@end
