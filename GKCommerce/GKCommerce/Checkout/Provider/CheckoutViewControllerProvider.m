//
//  CheckoutViewControllerProvider.m
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "CheckoutViewControllerProvider.h"
#import "CheckoutViewController.h"

@implementation CheckoutViewControllerProvider

- (id)provide:(JSObjectionInjector *)context arguments:(NSArray *)arguments
{
    CheckoutViewController *controller;
    controller = [[CheckoutViewController alloc] initWithUser:arguments[0]
                                                         cart:arguments[1]];
    
    [context injectDependencies:controller];
    return controller;
}
@end
