//
//  UIToggleButton.m
//  GKCommerce
//
//  Created by 小悟空 on 11/24/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKToggleButton.h"

@implementation GKToggleButton
{
    UIImageView *_onImageView;
    UIImageView *_offImageView;
    UITapGestureRecognizer *_recognizer;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
        self.on = NO;
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"on"];
    [self removeObserver:self forKeyPath:@"onImage"];
    [self removeObserver:self forKeyPath:@"offImage"];
    [self removeGestureRecognizer:_recognizer];
}

- (void)setup
{
    [self addObserver:self forKeyPath:@"on" options:0 context:nil];
    [self addObserver:self forKeyPath:@"onImage" options:0 context:nil];
    [self addObserver:self forKeyPath:@"offImage" options:0 context:nil];
    
    self.userInteractionEnabled = YES;
    _recognizer = [[UITapGestureRecognizer alloc]
                   initWithTarget:self action:@selector(didTapSelf:)];
    [self addGestureRecognizer:_recognizer];
}

- (void)didTapSelf:(id)sender
{
    self.on = !self.on;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([@"on" isEqualToString:keyPath]) {
        if (self.on) {
            [_offImageView removeFromSuperview];
            self.alpha = 0.0f;
            [self addSubview:_onImageView];
        } else {
            [_onImageView removeFromSuperview];
            self.alpha = 0.0f;
            [self addSubview:_offImageView];
        }
    } else if ([@"onImage" isEqualToString:keyPath]) {
        _onImageView = [[UIImageView alloc] initWithImage:self.onImage];
    } else if ([@"offImage" isEqualToString:keyPath]) {
        _offImageView = [[UIImageView alloc] initWithImage:self.offImage];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
