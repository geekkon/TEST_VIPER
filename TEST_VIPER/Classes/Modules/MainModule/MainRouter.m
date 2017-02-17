//
//  MainRouter.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <UIKit/UINavigationController.h>
#import "MainRouter.h"

#import "ObjectAssembly.h"
#import "ObjectPresenter.h"

@implementation MainRouter

#pragma mark - MainRouterInputProtocol

- (void)showObjectControllerWithID:(NSInteger)objectID {
    
    ObjectPresenter *presenter = (ObjectPresenter *)[self.objectAssembly objectPresenter];
    presenter.objectID = @(objectID);
    
    [self.controller.navigationController pushViewController:(UIViewController *)presenter.controller animated:YES];
}

@end
