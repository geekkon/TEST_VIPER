//
//  ObjectViewModel.h
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectViewModel : NSObject

@property (nonatomic, assign) NSInteger objectID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, assign) NSString *count;
@property (nonatomic, assign) BOOL isActive;

@end
