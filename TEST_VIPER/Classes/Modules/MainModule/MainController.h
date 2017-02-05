//
//  MainController.h
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainControllerInputProtocol.h"

@protocol MainControllerOutputProtocol;

@interface MainController : UIViewController <MainControllerInputProtocol>

@property (nonatomic, strong) id <MainControllerOutputProtocol> presenter;

@end
