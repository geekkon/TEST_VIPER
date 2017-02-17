//
//  MainAssembly.m
//  TEST_VIPER
//
//  Created by Artur on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainAssembly.h"
#import "AppDelegate.h"

#import "MainController.h"
#import "MainPresenter.h"
#import "MainInteractor.h"
#import "MainRouter.h"

#import "NonameService.h"
#import "ManagedObjectStorage.h"

@implementation MainAssembly

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(controller) with:[self controller]];
    }];
}

- (id <MainControllerOutputProtocol>)presenter {
    return [TyphoonDefinition withClass:[MainPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(controller) with:[self controller]];
        [definition injectProperty:@selector(interactor) with:[self interactor]];
        [definition injectProperty:@selector(router) with:[self router]];
    }];
}


- (id <MainControllerInputProtocol>)controller {
    return [TyphoonDefinition withClass:[MainController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self presenter]];
    }];
}


- (id <MainInteractorInputProtocol>)interactor {
    return [TyphoonDefinition withClass:[MainInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self presenter]];
        [definition injectProperty:@selector(nonameService) with:[self nonameService]];
        [definition injectProperty:@selector(managedObjectStorage) with:[self managedObjectStorage]];
    }];
}


- (id <MainRouterInputProtocol>)router {
    return [TyphoonDefinition withClass:[MainRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(controller) with:[self controller]];
        [definition injectProperty:@selector(objectAssembly) with:self.objectAssembly];
    }];
}




- (NonameService *)nonameService {
    return [TyphoonDefinition withClass:[NonameService class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(managedObjectStorage) with:[self managedObjectStorage]];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (ManagedObjectStorage *)managedObjectStorage {
    return [TyphoonDefinition withClass:[ManagedObjectStorage class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end
