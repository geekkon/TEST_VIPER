//
//  NonameService.m
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "NonameService.h"
#import "ManagedObjectStorage.h"

static float const delay = 2.0;

@implementation NonameService

+ (instancetype)instance {
    static NonameService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NonameService alloc] init];
    });
    return instance;
}

- (void)fetchObjectsWithCompletion:(void (^)(BOOL success, NSError *error))completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (arc4random_uniform(1000) % 5) {
            [[ManagedObjectStorage instance] fillStorage];;
            completion(YES, nil);
        } else {
            completion(NO, [NSError errorWithDomain:@"Unknown error" code:400 userInfo:nil]);
        }
    });
}

@end
