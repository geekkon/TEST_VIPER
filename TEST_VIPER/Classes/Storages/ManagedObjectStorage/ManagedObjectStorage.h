//
//  ManagedObjectStorage.h
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagedObject;

@interface ManagedObjectStorage : NSObject

+ (instancetype)instance;

- (void)fillStorage;

- (NSArray <ManagedObject *> *)allObjects;
- (ManagedObject *)objectByID:(NSInteger)objectID;

- (void)createNewObject;

@end
