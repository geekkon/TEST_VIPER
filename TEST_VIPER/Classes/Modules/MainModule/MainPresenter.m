//
//  MainPresenter.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainPresenter.h"
#import "MainControllerInputProtocol.h"
#import "MainInteractorInputProtocol.h"
#import "MainWireframeInputProtocol.h"

@implementation MainPresenter

#pragma mark - MainControllerOutputProtocol

- (void)controllerDidLoad {
    [self.controller disableBarButtons];
    [self.controller showActivityIndicator];
    [self.interactor obtainObjects];
}

- (void)controllerDidSelectObjectID:(NSInteger)objectID {
    [self.wireframe showObjectControllerWithID:objectID];
}

- (void)controllerDidTapRefreshButton {
    [self.controller disableBarButtons];
    [self.controller showActivityIndicator];
    [self.controller updateContentWithObjectViewModels:nil];
    [self.interactor obtainObjects];
}

- (void)controllerDidTapAddButton {
    [self.interactor createNewObject];
}

#pragma mark - MainInteractorOutputProtocol

- (void)assignObjectViewModels:(NSArray <ObjectViewModel *> *)objectViewModels {
    [self.controller enableBarButtons];
    [self.controller hideActivityIndicator];
    [self.controller updateContentWithObjectViewModels:objectViewModels];
    if (objectViewModels.count == 0) {
        [self.controller showEmptyResultsPlaceholder];
    } else {
        [self.controller hideEmptyResultsPlaceholder];
    }
}

- (void)errorOccured:(NSError *)error {
    [self.controller enableBarButtons];
    [self.controller showEmptyResultsPlaceholder];
    [self.controller hideActivityIndicator];
    [self.controller showError:error];
}

@end
