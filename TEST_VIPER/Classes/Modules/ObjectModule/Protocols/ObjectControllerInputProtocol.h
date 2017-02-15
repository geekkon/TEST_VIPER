//
//  ObjectControllerInputProtocol.h
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ObjectInfoViewModel;

@protocol ObjectControllerInputProtocol <NSObject>

- (void)updateContentWithObjectInfoViewModel:(ObjectInfoViewModel *)objectInfo;

@end
