//
//  ProductDetailCarouselTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/10/22.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ProductDetailCarouselTableViewCell.h"
#import "NSString+GKResizable.h"

@implementation ProductDetailCarouselTableViewCell

- (void)awakeFromNib {
    self.carousel.delegate = self;
    
    [[RACObserve(self, product) filter:^BOOL(id value) {
        return nil != value;
     }] subscribeNext:^(id x) {
        [self.carousel reloadData];
     }];
}

#pragma mark - GKCarouselViewDelegate

- (GKCarouselViewCell *)carouselView:(GKCarouselView *)carouselView
                         cellAtIndex:(NSInteger)index
{
  CGRect carouselRectangle;
  carouselRectangle = CGRectMake(0.0f, 0.0f, 320.0f, 320.0f);
  GKCarouselViewCell *cell = [[GKCarouselViewCell alloc]
                              initWithFrame:carouselRectangle];
  NSString *picture;
  picture = [self.product.pictures objectAtIndex:index];
  
  DDLogVerbose(@"Carousel 产品图片地址 %@", picture);
  RACSignal *signal;
  signal = [[[[picture GKRCropAndFill] width:640.0f] height:640.0f] signal];
  RAC(cell.imageView, image) = signal;
  return cell;
}

- (NSInteger)numberOfCellsInCarouselView:(GKCarouselView *)carouselView
{
    return self.product.pictures.count;
}

@end
