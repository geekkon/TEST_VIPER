//
//  MainRouter.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainRouterInputProtocol.h"

@class UIViewController;

@interface MainRouter : NSObject <MainRouterInputProtocol>

@property (nonatomic, weak) UIViewController *controller;

@end
