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
  self.avatarImageView.layer.cornerRadius =
    self.avatarImageView.frame.size.width / 2;
  self.avatarImageView.layer.masksToBounds = YES;
  @weakify(self);
  [RACObserve([App shared], currentUser) subscribeNext:^(GKUser *user) {
    @strongify(self);
    BOOL authorized = [user authorized];
    self.avatarContainer.hidden = !authorized;
    self.buttonContainer.hidden = authorized;
//    RACSignal *signal;
//    signal = [[[[[[user avatar] width:80.0f]
//                height:80.0f] cropAndFill] signal]
//              deliverOn:[RACScheduler mainThreadScheduler]];
    
//    RAC(self.avatarImageView, image) = signal;
  }];
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
