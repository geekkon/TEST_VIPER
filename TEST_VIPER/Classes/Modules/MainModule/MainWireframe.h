//
//  MainWireframe.h
//  TEST_VIPER
//
//  Created by Dim on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainWireframeInputProtocol.h"

@class UIWindow;

@interface MainWireframe : NSObject <MainWireframeInputProtocol>

- (void)installRootControllerInWindow:(UIWindow *)window;

@end
