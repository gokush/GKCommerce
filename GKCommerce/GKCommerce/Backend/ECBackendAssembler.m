//
//  ECBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECBackendAssembler.h"

@implementation ECBackendAssembler

- (NSError *)error:(NSDictionary *)JSON
{
    NSError *error;
    
    if ([[JSON valueForKeyPath:@"status.succeed"] integerValue] == 0) {
        NSInteger errorCode;
        NSDictionary *errorDescription;
        errorCode = [[JSON valueForKeyPath:@"status.error_code"] integerValue];
        errorDescription = @{
                             NSLocalizedDescriptionKey:
                                 [JSON valueForKeyPath:@"status.error_desc"]
                             };
        error = [NSError errorWithDomain:@"ECMobile" code:errorCode
                                userInfo:errorDescription];
    }
    
    return error;
}

- (NSString *)digitalWithString:(NSString *)string
{
    NSString *pattern = @"([\\d\\.]+)";
    NSError *error;
    NSRegularExpression *expression;
    if (!string || nil == string || [string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                           options:0
                                                             error:&error];
    NSArray *matches = [expression matchesInString:string
                                           options:0
                                             range:NSMakeRange(0, string.length)
                        ];
    
    for (NSTextCheckingResult *match in matches) {
        return [string substringWithRange:[match range]];
    }
    return nil;
}
@end
