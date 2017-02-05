//
//  MainModuleConstructor.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainModuleConstructor.h"
#import "MainController.h"
#import "MainPresenter.h"
#import "MainInteractor.h"
#import "MainRouter.h"

@implementation MainModuleConstructor

+ (UIViewController *)constructModule {
    
    MainController *controller = [[MainController alloc] init];
    MainPresenter *presenter = [[MainPresenter alloc] init];
    MainInteractor *interactor = [[MainInteractor alloc] init];
    MainRouter *router = [[MainRouter alloc] init];
    
    controller.presenter = presenter;
    
    presenter.controller = controller;
    presenter.interactor = interactor;
    presenter.router = router;
    
    interactor.presenter = presenter;
    
    router.controller = controller;
    
    return controller;
}

@end
