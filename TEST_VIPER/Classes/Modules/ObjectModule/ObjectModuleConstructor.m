//
//  ObjectModuleConstructor.m
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectModuleConstructor.h"
#import "ObjectController.h"
#import "ObjectPresenter.h"
#import "ObjectInteractor.h"

@implementation ObjectModuleConstructor

+ (UIViewController *)constructModuleWithObjectID:(NSInteger)objectID {
    
    ObjectController *controller = [[ObjectController alloc] init];
    ObjectPresenter *presenter = [[ObjectPresenter alloc] initWithObjectID:objectID];
    ObjectInteractor *interactor = [[ObjectInteractor alloc] init];
    
    controller.presenter = presenter;
    
    presenter.controller = controller;
    presenter.interactor = interactor;
    
    interactor.presenter = presenter;
    
    return controller;
}

@end
