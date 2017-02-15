//
//  ManagedObject.h
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ManagedObjectType) {
    ManagedObjectTypeOne,
    ManagedObjectTypeTwo,
    ManagedObjectTypeThree
};

@interface ManagedObject : NSObject

@property (nonatomic, assign) NSInteger objectID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *info;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) ManagedObjectType type;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) BOOL isActive;

@end
