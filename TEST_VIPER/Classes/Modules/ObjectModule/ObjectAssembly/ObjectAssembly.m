//
//  ObjectAssembly.m
//  TEST_VIPER
//
//  Created by Artur on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectAssembly.h"
#import "MainAssembly.h"

#import "ObjectController.h"
#import "ObjectPresenter.h"
#import "ObjectInteractor.h"

@implementation ObjectAssembly

- (id <ObjectControllerInputProtocol>)objectController {
    return [TyphoonDefinition withClass:[ObjectController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self objectPresenter]];
    }];
}


- (id <ObjectControllerOutputProtocol>)objectPresenter {
    return [TyphoonDefinition withClass:[ObjectPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(controller) with:[self objectController]];
        [definition injectProperty:@selector(interactor) with:[self objectInteractor]];
    }];
}


- (id <ObjectInteractorInputProtocol>)objectInteractor {
    return [TyphoonDefinition withClass:[ObjectInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self objectPresenter]];
        [definition injectProperty:@selector(managedObjectStorage) with:[self.mainAssambly managedObjectStorage]];
    }];
}

@end
