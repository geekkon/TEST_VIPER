//
//  NonameService.h
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagedObject;

@interface NonameService : NSObject

+ (instancetype)instance;

- (void)fetchObjectsWithCompletion:(void (^)(BOOL success, NSError *error))completion;

@end
