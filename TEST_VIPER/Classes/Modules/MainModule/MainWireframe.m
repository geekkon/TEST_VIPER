//
//  MainWireframe.m
//  TEST_VIPER
//
//  Created by Dim on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainWireframe.h"
#import <UIKit/UIWindow.h>
#import "MainController.h"
#import "MainPresenter.h"
#import "MainInteractor.h"
#import "ObjectWireframe.h"

@interface MainWireframe ()

@property (nonatomic, weak) MainController *controller;

@end

@implementation MainWireframe

- (void)installRootControllerInWindow:(UIWindow *)window {
    
    MainController *controller = [[MainController alloc] init];
    MainPresenter *presenter = [[MainPresenter alloc] init];
    MainInteractor *interactor = [[MainInteractor alloc] init];
    
    controller.presenter = presenter;
    
    presenter.controller = controller;
    presenter.interactor = interactor;
    presenter.wireframe = self;
    
    interactor.presenter = presenter;
    
    self.controller = controller;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.controller];
    
    window.rootViewController = navigationController;
}

#pragma mark - MainWireframeInputProtocol

- (void)showObjectControllerWithID:(NSInteger)objectID {
    ObjectWireframe *objectWireframe = [[ObjectWireframe alloc] init];
    [objectWireframe showObjectControllerWithObjectID:objectID fromController:self.controller];
}

@end
