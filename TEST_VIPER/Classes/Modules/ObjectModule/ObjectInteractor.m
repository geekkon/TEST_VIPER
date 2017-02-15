//
//  ObjectInteractor.m
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectInteractor.h"
#import "ObjectInteractorOutputProtocol.h"
#import "ManagedObjectStorage.h"
#import "ManagedObject.h"
#import "ObjectInfoViewModel.h"

@implementation ObjectInteractor

#pragma mark - ObjectInteractorInputProtocol

- (void)obtainObjectWithID:(NSInteger)objectID {
    ManagedObject *mangedObject = [[ManagedObjectStorage instance] objectByID:objectID];
    [self.presenter assignObjectInfoViewModel:[self prepareObjectInfoViewModelFromManagedObject:mangedObject]];
}

#pragma mark - Interactor Logic

- (ObjectInfoViewModel *)prepareObjectInfoViewModelFromManagedObject:(ManagedObject *)managedObject {
    ObjectInfoViewModel *objectInfoViewModel = [ObjectInfoViewModel new];
    objectInfoViewModel.name = managedObject.name;
    objectInfoViewModel.info = managedObject.info;
    return objectInfoViewModel;
}

@end
