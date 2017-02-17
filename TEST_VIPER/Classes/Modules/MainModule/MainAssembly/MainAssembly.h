//
//  MainAssembly.h
//  TEST_VIPER
//
//  Created by Artur on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>
#import "ObjectAssembly.h"
@class ManagedObjectStorage;

@interface MainAssembly : TyphoonAssembly

@property (nonatomic, strong) ObjectAssembly *objectAssembly;

- (ManagedObjectStorage *)managedObjectStorage;

@end
