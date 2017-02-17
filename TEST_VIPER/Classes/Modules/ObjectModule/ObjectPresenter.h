//
//  ObjectPresenter.h
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectControllerOutputProtocol.h"
#import "ObjectInteractorOutputProtocol.h"

@protocol ObjectControllerInputProtocol;
@protocol ObjectInteractorInputProtocol;

@interface ObjectPresenter : NSObject <ObjectControllerOutputProtocol, ObjectInteractorOutputProtocol>

@property (nonatomic, weak) id <ObjectControllerInputProtocol> controller;
@property (nonatomic, strong) id <ObjectInteractorInputProtocol> interactor;

@property (strong, nonatomic) NSNumber *objectID;

@end
