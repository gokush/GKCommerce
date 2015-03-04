//
//  FeatureCarouselTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "FeatureCarouselTableViewCell.h"
#import "FeatureCarouselModel.h"
#import "GKResizer.h"

@implementation FeatureCarouselTableViewCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"carousels"];
}

- (void)awakeFromNib {
    self.carouselView.delegate = self;
    
    [self addObserver:self
           forKeyPath:@"carousels"
              options:NSKeyValueObservingOptionInitial
              context:nil];
    

}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([@"carousels" isEqualToString:keyPath])
        [self.carouselView reloadData];
}

#pragma mark - WKCarouselViewDelegate
- (NSInteger)numberOfCellsInCarouselView:(GKCarouselView *)carouselView
{
    NSInteger number = 0;
    if (self.carousels)
        number = self.carousels.count;
    return number;
}

- (GKCarouselViewCell *)carouselView:(GKCarouselView *)carouselView
                         cellAtIndex:(NSInteger)index
{
    FeatureCarouselModel *model = [self.carousels objectAtIndex:index];
    GKCarouselViewCell *cell;
    cell = [[GKCarouselViewCell alloc]
            initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 140.0f)];
    RAC(cell.imageView, image) =
        [[GKResizer resizerWithString:model.picture.absoluteString] signal];
//    cell.imageURL = model.picture;
    return cell;
}
@end
