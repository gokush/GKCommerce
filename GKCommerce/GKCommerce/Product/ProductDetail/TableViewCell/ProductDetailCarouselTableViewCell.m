//
//  ProductDetailCarouselTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/10/22.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ProductDetailCarouselTableViewCell.h"

@implementation ProductDetailCarouselTableViewCell

- (void)awakeFromNib {
    self.carousel.delegate = self;
}

- (void)renderCarousel
{
    [self.carousel reloadData];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([@"product" isEqualToString:keyPath])
        [self renderCarousel];
}

- (void)bind
{
    [self addObserver:self forKeyPath:@"product"
              options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self removeObserver:self forKeyPath:@"product"];
}

#pragma mark - GKCarouselViewDelegate

- (GKCarouselViewCell *)carouselView:(GKCarouselView *)carouselView
                         cellAtIndex:(NSInteger)index
{
    CGRect carouselRectangle;
    carouselRectangle = CGRectMake(0.0f, 0.0f, 320.0f, 320.0f);
    GKCarouselViewCell *cell = [[GKCarouselViewCell alloc]
                                initWithFrame:carouselRectangle];
    ProductImageURL *picture;
    picture = [self.product.pictures objectAtIndex:index];
    cell.imageURL = [[NSURL alloc] initWithString:picture.origin];
    return cell;
}

- (NSInteger)numberOfCellsInCarouselView:(GKCarouselView *)carouselView
{
    return self.product.pictures.count;
}

@end
