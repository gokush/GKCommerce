//
//  RegistrationTableViewCell.m
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKRegistrationTableViewCell.h"
#define EMAIL_REGEX @"^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$"


@implementation GKRegistrationTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)isValidEmail:(NSString *)emailText {
    return [self matchRegex:EMAIL_REGEX string:emailText];
}


- (BOOL)matchRegex:(NSString*)regexStr string:(NSString*)str
{
    NSError *err = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&err];
    NSUInteger numOfMatch = [regex numberOfMatchesInString:str
                                                   options:NSMatchingAnchored
                                                     range:NSMakeRange(0, [str length])];
    return (numOfMatch>0);
}

@end
