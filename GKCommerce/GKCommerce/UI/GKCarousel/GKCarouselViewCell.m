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
#import <Masonry/Masonry.h>

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
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.mas_width);
//            make.height.equalTo(@120);
//            make.top.equalTo(self.mas_top);
//            make.bottom.equalTo(self.mas_bottom);
//            make.leading.equalTo(self.mas_leading);
            make.edges.equalTo(self);
        }];
        
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
