//
//  MainControllerInputProtocol.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ObjectViewModel;

@protocol MainControllerInputProtocol <NSObject>

- (void)showActivityIndicator;
- (void)hideActivityIndicator;
- (void)showEmptyResultsPlaceholder;
- (void)hideEmptyResultsPlaceholder;
- (void)disableBarButtons;
- (void)enableBarButtons;
- (void)updateContentWithObjectViewModels:(NSArray <ObjectViewModel *> *)objectViewModels;
- (void)showError:(NSError *)error;

@end
