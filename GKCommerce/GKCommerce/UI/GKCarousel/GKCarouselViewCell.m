//
//  WKSlideButton.m
//  WuKongCommerce
//
//  Created by 小悟空 on 14-9-10.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "GKCarouselViewCell.h"
#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GKCarouselViewCell()
{
    UIActivityIndicatorView *activity;
}

@end

@implementation GKCarouselViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self addSubview:activity];
    [self.imageView sd_setImageWithURL:imageURL];
}
@end
