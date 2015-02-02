//
//  NSString+NSBundle.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "NSString+NSBundle.h"
#import <CommonCrypto/CommonDigest.h>

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

- (NSString *)md5
{
  const char *cStr = [self UTF8String];
  unsigned char result[CC_MD5_DIGEST_LENGTH];
  CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
  return [NSString stringWithFormat:
          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
          result[0], result[1], result[2], result[3],
          result[4], result[5], result[6], result[7],
          result[8], result[9], result[10], result[11],
          result[12], result[13], result[14], result[15]
          ];
}
@end
