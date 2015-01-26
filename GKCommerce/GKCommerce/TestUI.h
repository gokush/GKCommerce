//
//  TestUI.h
//  GKCommerce
//
//  Created by 小悟空 on 12/11/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestUI : NSObject <UINavigationControllerDelegate>

- (void)gotoCheckout:(UITabBarController *)tabBarController;
- (void)gotoAddAddress:(UITabBarController *)tabBarController;
- (void)gotoProductList:(UITabBarController *)tabBarController;
@end
