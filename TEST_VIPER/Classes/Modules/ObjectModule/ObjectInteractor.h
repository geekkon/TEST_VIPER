//
//  ObjectInteractor.h
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectInteractorInputProtocol.h"

@protocol ObjectInteractorOutputProtocol;

@interface ObjectInteractor : NSObject <ObjectInteractorInputProtocol>

@property (nonatomic, weak) id <ObjectInteractorOutputProtocol> presenter;

@end
