//
//  ProductMoreTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductMoreTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ProductMoreTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CALayer *first = [CALayer layer];
    first.frame = CGRectMake(0.0f, height - 2, width, 1);
    first.backgroundColor = [UIColor colorWithRed:204.0f/255.0f
                                            green:204.0f/255.0f
                                             blue:204.0f/255.0f
                                            alpha:1.0f].CGColor;
    [self.layer addSublayer:first];
    
    CALayer *second = [CALayer layer];
    second.frame = CGRectMake(0.0, height - 1, width, 1);
    second.backgroundColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:second];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
