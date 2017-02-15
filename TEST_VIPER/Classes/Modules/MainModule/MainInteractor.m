//
//  MainInteractor.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainInteractor.h"
#import "MainInteractorOutputProtocol.h"
#import "NonameService.h"
#import "ManagedObjectStorage.h"
#import "ManagedObject.h"
#import "ObjectViewModel.h"

@implementation MainInteractor

#pragma mark - MainInteractorInputProtocol

- (void)obtainObjects {
    __weak typeof(self) weakSelf = self;
    [[NonameService instance] fetchObjectsWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            [weakSelf obtainObjectsFromStorage];
        } else {
            [weakSelf.presenter errorOccured:error];
        }
    }];
}

- (void)createNewObject {
    [[ManagedObjectStorage instance] createNewObject];
    NSArray <ManagedObject *> *managedObjects = [[ManagedObjectStorage instance] allObjects];
    [self.presenter assignObjectViewModels:[self prepareObjectViewModelsFromManagedObjects:managedObjects]];
}

#pragma mark - Interactor Logic

- (void)obtainObjectsFromStorage {
    NSArray <ManagedObject *> *managedObjects = [[ManagedObjectStorage instance] allObjects];
    if (arc4random_uniform(1000) % 3) {
        [self.presenter assignObjectViewModels:[self prepareObjectViewModelsFromManagedObjects:managedObjects]];
    } else {
        [self.presenter assignObjectViewModels:nil];
    }
}

- (NSArray <ObjectViewModel *> *)prepareObjectViewModelsFromManagedObjects:(NSArray <ManagedObject *> *)managedObjects {
    NSMutableArray <ObjectViewModel *> *objectViewModels = [NSMutableArray arrayWithCapacity:managedObjects.count];
    for (ManagedObject *managedObject in managedObjects) {
        [objectViewModels addObject:[self createObjectViewModelFromManagedObject:managedObject]];
    }
    NSSortDescriptor *createdSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"created" ascending:YES];
    return [objectViewModels sortedArrayUsingDescriptors:@[createdSortDescriptor]];
}

- (ObjectViewModel *)createObjectViewModelFromManagedObject:(ManagedObject *)managedObject {
    ObjectViewModel *objectViewModel = [ObjectViewModel new];
    objectViewModel.objectID = managedObject.objectID;
    objectViewModel.name = managedObject.name;
    objectViewModel.created = [[NSDate dateWithTimeIntervalSince1970:managedObject.created] description];
    objectViewModel.count = [NSString stringWithFormat:@"%ld", (long)managedObject.count];
    objectViewModel.isActive = managedObject.isActive;
    return objectViewModel;
}

@end
