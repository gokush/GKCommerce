//
//  MallSecondCategoryCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductCategoryChildTableViewCell.h"
#import "ProductCategoryChildTableViewCellGrid.h"

@interface ProductCategoryChildTableViewCellButton : UIButton
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) ProductCategory *productCategory;
@end

@implementation ProductCategoryChildTableViewCellButton
- (id)initWithProductCategory:(ProductCategory *)productCategory
              AtIndex:(NSInteger)index
{
    CGRect frame;
    frame = CGRectMake(107.0 * (index % 3),
                       48.0  * (index / 3) + 1, 106, 48);
    self = [super initWithFrame:frame];
    
    if (self) {
        self.index = index;
        self.productCategory = productCategory;
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.tag = self.index;
    self.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self setTitle:self.productCategory.name forState:UIControlStateNormal];
}
@end

@implementation ProductCategoryChildTableViewCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"categories"];
}

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:235/255.0
                                                           green:235/255.0
                                                            blue:235/255.0
                                                           alpha:1];
        self.gridView = [[ProductCategoryChildTableViewCellGrid alloc] init];
        self.gridView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.gridView];
        
        [self addObserver:self
               forKeyPath:@"categories"
                  options:NSKeyValueObservingOptionInitial
                  context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([@"categories" isEqualToString:keyPath])
        [self setupButtons];
}

- (void)setupButtons
{
    for (id view in self.contentView.subviews) {
        if (view != self.gridView) {
            [view removeFromSuperview];
        }
    }
    int i, size;
    size = self.categories.count;
    for (i = 0; i < size; i++) {
        ProductCategoryChildTableViewCellButton *button;
        ProductCategory *category;
        category = [self.categories objectAtIndex:i];
        button = [[ProductCategoryChildTableViewCellButton alloc]
                  initWithProductCategory:category AtIndex:i];
        [button addTarget:self
                   action:@selector(didTapButton:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
    }
    float height = (size + 2) / 3 * 48;
    self.frame = CGRectMake(0, 0, self.frame.size.width, height);
    self.gridView.frame = CGRectMake(0, 0, self.frame.size.width, height);
}

- (void)didTapButton:(UIButton*)sender
{
    if ([self.delegate
         respondsToSelector:@selector(productCategoryChildTableViewCell:
                                      didSelectedAtRow:column:)]) {
        [self.delegate productCategoryChildTableViewCell:self
                                        didSelectedAtRow:self.row
                                                  column:sender.tag];
    }
}
@end
