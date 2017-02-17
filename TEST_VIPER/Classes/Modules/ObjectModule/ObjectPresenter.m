//
//  ObjectPresenter.m
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectPresenter.h"
#import "ObjectControllerInputProtocol.h"
#import "ObjectInteractorInputProtocol.h"

@implementation ObjectPresenter

#pragma mark - ObjectControllerOutputProtocol

- (void)controllerDidLoad {
    [self.interactor obtainObjectWithID:self.objectID];
}

#pragma mark - ObjectInteractorOutputProtocol

- (void)assignObjectInfoViewModel:(ObjectInfoViewModel *)objectInfoViewModel {
    [self.controller updateContentWithObjectInfoViewModel:objectInfoViewModel];
}

@end
