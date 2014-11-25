//
//  GKLabel.m
//  GKCommerce
//
//  Created by 小悟空 on 11/22/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKLabel.h"

@implementation UILabel(Strikethrough)

- (void)setStrikethrough
{
    NSMutableAttributedString *attribute;
    attribute = [[NSMutableAttributedString alloc]
                 initWithAttributedString:self.attributedText];
    NSNumber *strikethrough = [NSNumber numberWithInt:NSUnderlineStyleSingle];
    int length = self.text.length;
    [attribute addAttribute:NSStrikethroughStyleAttributeName
                      value:strikethrough range:NSMakeRange(0, length)];
    self.attributedText = attribute;
}
@end
