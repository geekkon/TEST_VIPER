//
//  ObjectWireframe.m
//  TEST_VIPER
//
//  Created by Dim on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectWireframe.h"
#import "ObjectController.h"
#import "ObjectPresenter.h"
#import "ObjectInteractor.h"

@implementation ObjectWireframe

- (void)showObjectControllerWithObjectID:(NSInteger)objectID fromController:(UIViewController *)fromController {
    
    ObjectController *controller = [[ObjectController alloc] init];
    ObjectPresenter *presenter = [[ObjectPresenter alloc] initWithObjectID:objectID];
    ObjectInteractor *interactor = [[ObjectInteractor alloc] init];
    
    controller.presenter = presenter;
    
    presenter.controller = controller;
    presenter.interactor = interactor;
    
    interactor.presenter = presenter;
    
    [fromController.navigationController pushViewController:controller animated:YES];
}

@end
