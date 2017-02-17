//
//  ManagedObjectStorage.m
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ManagedObjectStorage.h"
#import "ManagedObject.h"

static NSInteger const objectsCount = 10;

@interface ManagedObjectStorage ()

@property (nonatomic, strong) NSMutableArray <ManagedObject *> *objects;

@end

@implementation ManagedObjectStorage

#pragma mark - Public

- (void)fillStorage {
   self.objects = [self createManagedObjects];
}

- (NSArray <ManagedObject *> *)allObjects {
    return [self.objects copy];
}

- (ManagedObject *)objectByID:(NSNumber *)objectID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"objectID == %d", [objectID integerValue]];
    NSArray <ManagedObject *> *filtered = [self.objects filteredArrayUsingPredicate:predicate];
    return filtered.firstObject;
}

- (void)createNewObject {
    [self.objects addObject:[self createManagedObjectWithIndex:self.objects.count]];
}

#pragma mark - Private

- (NSMutableArray <ManagedObject *> *)createManagedObjects {
    NSMutableArray <ManagedObject *> *managedObjects = [[NSMutableArray alloc] initWithCapacity:objectsCount];
    for (NSInteger i = 0; i < objectsCount; i++) {
        [managedObjects addObject:[self createManagedObjectWithIndex:i]];
    }
    return managedObjects;
}

- (ManagedObject *)createManagedObjectWithIndex:(NSInteger)index {
    ManagedObject *managedObject = [ManagedObject new];
    managedObject.objectID = index;
    managedObject.name = [NSString stringWithFormat:@"Object #%ld", (long)index];
    managedObject.info = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    managedObject.count = arc4random_uniform(100);
    managedObject.type = arc4random_uniform(1000) % 2;
    managedObject.created = arc4random_uniform(1000000000);
    managedObject.isActive = managedObject.created % 2;
    return managedObject;
}

@end
