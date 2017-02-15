//
//  MainInteractorOutputProtocol.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ObjectViewModel;

@protocol MainInteractorOutputProtocol <NSObject>

- (void)assignObjectViewModels:(NSArray <ObjectViewModel *> *)objectViewModels;
- (void)errorOccured:(NSError *)error;

@end
