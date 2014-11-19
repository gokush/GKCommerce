//
//  MineHeaderPhotoTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 11/17/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "MineHeaderPhotoTableViewCell.h"

@implementation MineHeaderPhotoTableViewCell

- (void)awakeFromNib
{
    self.buttonContainer.layer.cornerRadius = 5.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapSignup:(id)sender
{
    SEL selector = @selector(headerPhoto:didTapSignup:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate headerPhoto:self didTapSignup:sender];
}

- (IBAction)didTapAuthenticate:(id)sender
{
    SEL selector = @selector(headerPhoto:didTapAuthenticate:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate headerPhoto:self didTapAuthenticate:sender];
}

@end
