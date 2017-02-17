//
//  ObjectWireframe.h
//  TEST_VIPER
//
//  Created by Dim on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@interface ObjectWireframe : NSObject

- (void)showObjectControllerWithObjectID:(NSInteger)objectID fromController:(UIViewController *)fromController;

@end
