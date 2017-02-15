//
//  ObjectController.h
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectControllerInputProtocol.h"

@protocol ObjectControllerOutputProtocol;

@interface ObjectController : UIViewController <ObjectControllerInputProtocol>

@property (nonatomic, strong) id <ObjectControllerOutputProtocol> presenter;

@end
