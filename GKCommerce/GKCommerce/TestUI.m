//
//  TestUI.m
//  GKCommerce
//
//  Created by 小悟空 on 12/11/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "TestUI.h"
#import "CartViewController.h"
#import "MineDefaultViewController.h"
//#import "GKAddressEditController.h"
#import "GKAddressListController.h"
#import "App.h"
#import "ProductListViewController.h"

@implementation TestUI

- (void)gotoCheckout:(UITabBarController *)tabBarController
{
    tabBarController.selectedIndex = 2;
    UINavigationController *navigation;
    navigation = (UINavigationController *)
        tabBarController.selectedViewController;
    
    CartViewController *viewController;
    viewController = (CartViewController *)
        navigation.viewControllers.firstObject;
    
    int64_t delayInSeconds = 1;
    dispatch_time_t popTime;
    popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        GKUser *user = [[App shared] currentUser];

        if ([viewController isViewLoaded] && ![user.cart empty]) {
            [viewController.selectAll tapButton];
            [viewController didTapCheckout:nil];
        }
    });
    
}

- (void)gotoAddAddress:(UITabBarController *)tabBarController
{
    tabBarController.selectedIndex = 3;
    MineDefaultViewController *viewController;
    UINavigationController *navigation;
    navigation = (UINavigationController *)
        tabBarController.selectedViewController;
    viewController = navigation.viewControllers.firstObject;
    
    [self delay:1 perform:^{
        [viewController pushAddressList];
        [self delay:1 perform:^{
            UIViewController *edit;
//            edit = [[GKAddressEditController alloc]
//                    initWithAddress:nil user:[[App shared] currentUser]];
//            [navigation pushViewController:edit animated:YES];
        }];
    }];
    
}

- (void)gotoAddressList:(UITabBarController *)tabBarController
{
  tabBarController.selectedIndex = 3;
  MineDefaultViewController *viewController;
  UINavigationController *navigation;
  navigation = (UINavigationController *)
  tabBarController.selectedViewController;
  viewController = navigation.viewControllers.firstObject;
  
  [self delay:1 perform:^{
    GKAddressListController *listController;
//    listController = [GKAddressListController addressListControllerWithMock];
//    [navigation pushViewController:listController animated:YES];
  }];
}

- (void)gotoProductList:(UITabBarController *)tabBarController
{
  tabBarController.selectedIndex = 1;
  UINavigationController *navigation;
  navigation = (UINavigationController *)
  tabBarController.selectedViewController;
  
  [self delay:1 perform:^{
    ProductListViewController *viewController;
    ProductCategory *category = [[ProductCategory alloc] init];
    category.name = @"iPhone";
    
    viewController = [[ProductListViewController alloc]
                      initWithProductCategory:category user:nil];
    [navigation pushViewController:viewController animated:YES];
  }];
}

- (void)delay:(int64_t)second perform:(void(^)())block
{
    dispatch_time_t popTime;
    popTime = dispatch_time(DISPATCH_TIME_NOW, second * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        block();
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
