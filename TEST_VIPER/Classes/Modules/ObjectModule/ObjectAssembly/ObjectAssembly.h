//
//  ObjectAssembly.h
//  TEST_VIPER
//
//  Created by Artur on 17.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>
@class MainAssembly;

#import "ObjectControllerOutputProtocol.h"
#import "ObjectControllerInputProtocol.h"
#import "ObjectInteractorInputProtocol.h"

@interface ObjectAssembly : TyphoonAssembly

@property (strong, nonatomic) MainAssembly *mainAssambly;

- (id <ObjectControllerOutputProtocol>)objectPresenter;

- (id <ObjectControllerInputProtocol>)objectController;

- (id <ObjectInteractorInputProtocol>)objectInteractor;

@end
