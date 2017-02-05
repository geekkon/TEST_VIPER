//
//  MainPresenter.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainControllerOutputProtocol.h"
#import "MainInteractorOutputProtocol.h"

@protocol MainControllerInputProtocol;
@protocol MainInteractorInputProtocol;
@protocol MainRouterInputProtocol;

@interface MainPresenter : NSObject <MainControllerOutputProtocol, MainInteractorOutputProtocol>

@property (nonatomic, weak) id <MainControllerInputProtocol> controller;
@property (nonatomic, strong) id <MainInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <MainRouterInputProtocol> router;

@end
