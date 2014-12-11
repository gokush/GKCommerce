//
//  TestUI.m
//  GKCommerce
//
//  Created by 小悟空 on 12/11/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "TestUI.h"
#import "CartViewController.h"

@implementation TestUI

- (void)enterCheckout:(UITabBarController *)tabBarController
{
    tabBarController.selectedIndex = 2;
    UINavigationController *navigation;
    navigation = (UINavigationController *)
        tabBarController.selectedViewController;
//    navigation.delegate = self;
    
    CartViewController *viewController;
    viewController = (CartViewController *)
        navigation.viewControllers.firstObject;
    
    int64_t delayInSeconds = 1;
    dispatch_time_t popTime;
    popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if ([viewController isViewLoaded]) {
            [viewController.selectAll tapButton];
            [viewController didTapCheckout:nil];
        }
    });
    
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[CartViewController class]]) {
        CartViewController *cartViewController =
            (CartViewController *)viewController;
        cartViewController.selectAll.on = YES;
    }
}
@end
