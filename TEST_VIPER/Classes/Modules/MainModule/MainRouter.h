//
//  MainRouter.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainRouterInputProtocol.h"
@class ObjectAssembly;
@class UIViewController;

@interface MainRouter : NSObject <MainRouterInputProtocol>

@property (nonatomic, weak) UIViewController *controller;

@property (nonatomic, strong) ObjectAssembly *objectAssembly;

@end
