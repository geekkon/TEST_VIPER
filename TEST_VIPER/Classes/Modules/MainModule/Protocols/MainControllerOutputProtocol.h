//
//  MainControllerOutputProtocol.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainControllerOutputProtocol <NSObject>

- (void)controllerDidLoad;
- (void)controllerDidSelectObjectID:(NSInteger)objectID;
- (void)controllerDidTapRefreshButton;
- (void)controllerDidTapAddButton;

@end
