//
//  MainRouter.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <UIKit/UINavigationController.h>
#import "MainRouter.h"
#import "ObjectModuleConstructor.h"

@implementation MainRouter

#pragma mark - MainRouterInputProtocol

- (void)showObjectControllerWithID:(NSInteger)objectID {
    UIViewController *controller = [ObjectModuleConstructor constructModuleWithObjectID:objectID];
    [self.controller.navigationController pushViewController:controller animated:YES];
}

@end
